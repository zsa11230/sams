/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import com.pig4cloud.pig.admin.api.entity.SamsScore;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.admin.mapper.SamsCourseElectiveMapper;
import com.pig4cloud.pig.admin.mapper.SamsCourseMajorMapper;
import com.pig4cloud.pig.admin.mapper.SamsScoreMapper;
import com.pig4cloud.pig.admin.service.SamsScoreService;
import com.pig4cloud.pig.admin.service.SysUserService;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生成绩管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:15:02
 */
@Slf4j
@Service
@AllArgsConstructor
public class SamsScoreServiceImpl extends ServiceImpl<SamsScoreMapper, SamsScore> implements SamsScoreService {

	private final SysUserService sysUserService;
	private final SamsCourseElectiveMapper samsCourseElectiveMapper;
	private final SamsCourseMajorMapper courseMajorMapperMapper;

	@Override
	public IPage<SamsScore> getPageList(Page page, SamsScore samsScore) {
		Integer userId = sysUserService.getUserId();
		if (userId != null) {
			return baseMapper.getPageList(page, samsScore, userId);
		} else {
			return null;
		}

	}

	@Override
	public IPage<SamsCourseMajor> getMajorPageList(Page page, SamsCourseMajor samsCourseMajor) {
		Integer userId = sysUserService.getUserId();
		if (userId != null) {
			return courseMajorMapperMapper.getMyMajorClass(page, samsCourseMajor, userId);
		} else {
			return null;
		}
	}

	@Override
	public IPage<SamsCourseElective> getElectivePageList(Page page, SamsCourseElective courseElective) {
		Integer userId = sysUserService.getUserId();
		if (userId != null) {
			return samsCourseElectiveMapper.getMyElectiveClass(page, courseElective, userId);
		} else {
			return null;
		}
	}

	@Override
	public IPage<SamsScore> getMajorStudent(Page page, SamsScore samsScore, Integer courseId) {
		IPage<SamsScore> list = baseMapper.getStudentByMajor(page, samsScore, courseId);
		return list;
	}

	@Override
	public IPage<SamsScore> getElectiveStudent(Page page, SamsScore samsScore, Integer courseId) {
		IPage<SamsScore> list = baseMapper.getStudentByElective(page, samsScore, courseId);
		return list;
	}

	@Override
	public R updateScore(SamsScore samsScore) {
		Integer id = samsScore.getId();
		if (id != null) {
			baseMapper.updateById(samsScore);
			return new R<>(Boolean.TRUE,"修改成功");
		} else {

				baseMapper.insert(samsScore);
				return new R<>(samsScore.getId(), "添加成功！");
		}

	}
}
