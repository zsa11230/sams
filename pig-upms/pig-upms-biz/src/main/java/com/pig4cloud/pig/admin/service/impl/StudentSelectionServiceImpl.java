/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.dto.ClassScheduleDTO;
import com.pig4cloud.pig.admin.api.entity.*;
import com.pig4cloud.pig.admin.api.vo.ClassScheduleVO;
import com.pig4cloud.pig.admin.mapper.ClassScheduleMapper;
import com.pig4cloud.pig.admin.mapper.StudentSelectionMapper;
import com.pig4cloud.pig.admin.service.*;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
@Slf4j
@Service
@AllArgsConstructor
public class StudentSelectionServiceImpl extends ServiceImpl<StudentSelectionMapper, StudentSelection> implements StudentSelectionService {

	private final SamsCourseElectiveService samsCourseElectiveService;
	private final ClassScheduleService classScheduleService;
	private final SysUserService sysUserService;
	private final SubjectScheduleRelationService subjectScheduleRelationService;
	private final ClassScheduleMapper classScheduleMapper;
	private final SamsCourseMajorService samsCourseMajorService;
	private final SamsScoreService samsScoreService;

	@Override
	public R<Boolean> create() {
		ClassSchedule schedule = new ClassSchedule();
		schedule.setScheduleName(baseMapper.getRealNameById(sysUserService.getUserId()) + "的选修课表");
		schedule.setUserId(sysUserService.getUserId());
		classScheduleService.save(schedule);
		Integer scheduleId = baseMapper.getScheduleIdByClassId(sysUserService.getUserId());
		List<SubjectScheduleRelation> list = subjectScheduleRelationService.getRelationListByscheduleId(scheduleId);
		for (SubjectScheduleRelation r : list) {
			r.setId(null);
			r.setScheduleId(schedule.getId());
			r.setType(0);
			subjectScheduleRelationService.save(r);

			Integer scoreId=baseMapper.getScoreIdById(sysUserService.getUserId(),r.getSubjectId(),"公共/必修课");
			if (scoreId==null){
				SamsScore samsScore=new SamsScore();
				samsScore.setCourseId(r.getSubjectId());
				samsScore.setCourseName(samsCourseMajorService.getById(r.getSubjectId()).getCourseName());
				samsScore.setCourseType("公共/必修课");
				samsScore.setUserId(sysUserService.getUserId());
				samsScoreService.save(samsScore);
			}
		}
		return new R<>(Boolean.TRUE, "选课成功！");
	}

	@Override
	public R updateCourse(ClassScheduleDTO classScheduleDTO) {

//验证能否选课
		SamsCourseElective courseElective = samsCourseElectiveService.getById(classScheduleDTO.getClassId());
		Integer number = courseElective.getNumber();
		Integer count = baseMapper.getCourseCount(classScheduleDTO.getClassId());
		if (count > number) {
			return new R<>(Boolean.FALSE, "班级人数已满!");
		} else {
			Integer scheduleId = baseMapper.getScheduleIdByClassId(sysUserService.getUserId());
			if (scheduleId == null) {
				return new R<>(null,"未到选课时间，不能选课!");
			}else {
			ClassSchedule classSchedule = classScheduleMapper.getByUserId(sysUserService.getUserId());

			List<ClassScheduleVO> subject = new ArrayList<>();
			for (Integer i = 0; i < 20; i++) {
				subject.add(new ClassScheduleVO());
			}

			SubjectScheduleRelation relation = new SubjectScheduleRelation();
			relation.setScheduleId(classSchedule.getId());
			relation.setSubjectId(classScheduleDTO.getClassId());
			relation.setSubjectTime(classScheduleDTO.getSubjectTime());
			relation.setType(1);
			subjectScheduleRelationService.save(relation);
			SamsScore samsScore=new SamsScore();
			samsScore.setCourseId(classScheduleDTO.getClassId());
			samsScore.setCourseName(samsCourseElectiveService.getById(classScheduleDTO.getClassId()).getCourseName());
			samsScore.setCourseType("公共/选修课");
			samsScore.setUserId(sysUserService.getUserId());
			samsScoreService.save(samsScore);
			List<SubjectScheduleRelation> relationList = subjectScheduleRelationService.getRelationListByscheduleId(classSchedule.getId());

			List<ClassScheduleVO> subjectList = new ArrayList<>();
			for (Integer i = 0; i < 20; i++) {
				subjectList.add(new ClassScheduleVO());
			}

			for (SubjectScheduleRelation r : relationList) {
				Integer subjectId = r.getSubjectId();
				String subjectName = "";
				if (r.getType().equals(0)) {
					subjectName = samsCourseMajorService.getById(subjectId).getCourseName();
				} else if (r.getType().equals(1)) {
					subjectName = samsCourseElectiveService.getById(subjectId).getCourseName();
				}

				ClassScheduleVO classScheduleVO = new ClassScheduleVO();
				classScheduleVO.setClassName(subjectName);
				classScheduleVO.setSubjectTime(r.getSubjectTime());
				classScheduleVO.setId(classSchedule.getId());
				classScheduleVO.setIsMajor(0);
				subjectList.set(r.getSubjectTime(), classScheduleVO);
			}

			return new R<>(subjectList, "选课成功！");
		}
		}

	}

	@Override
	public R<List<ClassScheduleVO>> getSchedule() {
		ClassSchedule schedule = classScheduleMapper.getByUserId(sysUserService.getUserId());

		if (schedule == null) {
			this.create();
			schedule = classScheduleMapper.getByUserId(sysUserService.getUserId());
		}

		List<SubjectScheduleRelation> relationList = subjectScheduleRelationService.getRelationListByscheduleId(schedule.getId());
		List<ClassScheduleVO> subjectList = new ArrayList<>();
		for (Integer i = 0; i < 20; i++) {
			subjectList.add(new ClassScheduleVO());
		}

		if (relationList != null) {
			for (SubjectScheduleRelation r : relationList) {
				Integer subjectId = r.getSubjectId();
				String subjectName = "";
				ClassScheduleVO classScheduleVO = new ClassScheduleVO();
				if (r.getType().equals(0)) {
					subjectName = samsCourseMajorService.getById(subjectId).getCourseName();
					classScheduleVO.setIsMajor(0);
				} else if (r.getType().equals(1)) {
					subjectName = samsCourseElectiveService.getById(subjectId).getCourseName();
					classScheduleVO.setIsMajor(1);
				}
				classScheduleVO.setClassName(subjectName);
				classScheduleVO.setSubjectTime(r.getSubjectTime());
				classScheduleVO.setId(schedule.getId());
				subjectList.set(r.getSubjectTime(), classScheduleVO);
			}
		}

		return new R<>(subjectList);
	}
}
