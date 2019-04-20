/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.dto.ClassScheduleDTO;
import com.pig4cloud.pig.admin.api.entity.ClassSchedule;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import com.pig4cloud.pig.admin.api.entity.SubjectScheduleRelation;
import com.pig4cloud.pig.admin.api.vo.ClassScheduleVO;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.admin.mapper.ClassScheduleMapper;
import com.pig4cloud.pig.admin.mapper.SamsClassInformationMapper;
import com.pig4cloud.pig.admin.service.ClassScheduleService;
import com.pig4cloud.pig.admin.service.SamsClassInformationService;
import com.pig4cloud.pig.admin.service.SamsCourseMajorService;
import com.pig4cloud.pig.admin.service.SubjectScheduleRelationService;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
@Slf4j
@Service
@AllArgsConstructor
public class ClassScheduleServiceImpl extends ServiceImpl<ClassScheduleMapper, ClassSchedule> implements ClassScheduleService {

	private final SamsClassInformationService samsClassInformationService;
	private final SubjectScheduleRelationService subjectScheduleRelationService;
	private final SamsCourseMajorService samsCourseMajorService;

	@Override
	public R<List<ClassScheduleVO>> createClassSchedule(Integer id) {

		SamsClassInformation clas = samsClassInformationService.getById(id);

		ClassSchedule schedule = new ClassSchedule();
		schedule.setScheduleName(clas.getClassName()+"的专业课表");
		schedule.setClassId(id);
		baseMapper.insert(schedule);

		List<ClassScheduleVO> list = new ArrayList<>();
		for(Integer i = 0 ; i<20 ; i++){
			list.add(new ClassScheduleVO());
		}
		return new R<>(list);
	}

	@Override
	public R<List<ClassScheduleVO>> updateByClassSchedule(ClassScheduleDTO classScheduleDTO) {

		Integer scheduleId = baseMapper.getIdByClassId(classScheduleDTO.getId());
		Integer classId = classScheduleDTO.getClassId();
		SubjectScheduleRelation relation = new SubjectScheduleRelation();
		relation.setScheduleId(scheduleId);
		relation.setSubjectId(classId);
		relation.setSubjectTime(classScheduleDTO.getSubjectTime());
		subjectScheduleRelationService.save(relation);

		List<SubjectScheduleRelation> relationList = subjectScheduleRelationService.getRelationListByscheduleId(scheduleId);

		List<ClassScheduleVO> subjectList = new ArrayList<>();
		for(Integer i = 0 ; i<20 ; i++){
			subjectList.add(new ClassScheduleVO());
		}

		for(SubjectScheduleRelation r : relationList){
			Integer subjectId = r.getSubjectId();
			SamsCourseMajor major = samsCourseMajorService.getById(subjectId);
			ClassScheduleVO classScheduleVO = new ClassScheduleVO();
			classScheduleVO.setClassName(major.getCourseName());
			classScheduleVO.setSubjectTime(r.getSubjectTime());
			classScheduleVO.setId(scheduleId);
			subjectList.set(r.getSubjectTime(),classScheduleVO);
		}

		return new R<>(subjectList);
	}

	@Override
	public R<List<ClassScheduleVO>> getClassById(Integer id) {
		Integer scheduleId = baseMapper.getIdByClassId(id);
		List<SubjectScheduleRelation> relationList = subjectScheduleRelationService.getRelationListByscheduleId(scheduleId);
		List<ClassScheduleVO> subjectList = new ArrayList<>();
		for(Integer i = 0 ; i<20 ; i++){
			subjectList.add(new ClassScheduleVO());
		}

		for(SubjectScheduleRelation r : relationList){
			Integer subjectId = r.getSubjectId();
			SamsCourseMajor major = samsCourseMajorService.getById(subjectId);
			ClassScheduleVO classScheduleVO = new ClassScheduleVO();
			classScheduleVO.setClassName(major.getCourseName());
			classScheduleVO.setSubjectTime(r.getSubjectTime());
			classScheduleVO.setId(scheduleId);
			subjectList.set(r.getSubjectTime(),classScheduleVO);
		}
		return new R<>(subjectList);
	}

	@Override
	public R<List<StudentVO>> getClassList(Integer classId) {
		if (classId!=null){
			List<StudentVO> list=baseMapper.getScheduleByMajor(classId);
			return new R<>(list);
		}else{
			return null;
		}

	}
}
