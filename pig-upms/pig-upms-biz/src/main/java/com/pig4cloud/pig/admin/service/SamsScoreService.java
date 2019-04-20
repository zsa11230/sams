/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import com.pig4cloud.pig.admin.api.entity.SamsScore;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

/**
 * 学生成绩管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:15:02
 */
public interface SamsScoreService extends IService<SamsScore> {
	/**
	 * 获取学生成绩分页
	 * @param page
	 * @param samsScore
	 * @return
	 */
	IPage<SamsScore> getPageList(Page page, SamsScore samsScore);

	/**
	 * 获取当前登录管理员的专业课程
	 * @param page
	 * @param samsCourseMajor
	 * @return
	 */
	IPage<SamsCourseMajor> getMajorPageList(Page page, SamsCourseMajor samsCourseMajor);

	/**
	 * 获取
	 * @param page
	 * @param courseElective
	 * @return
	 */
	IPage<SamsCourseElective> getElectivePageList(Page page, SamsCourseElective courseElective);

	/**
	 * 获取专业课程相关学生
	 * @param courseId
	 * @return
	 */
	IPage<SamsScore> getMajorStudent(Page page, SamsScore samsScore,Integer courseId);

	/**
	 * 获取选修课程学生
	 * @param courseId
	 * @return
	 */
	IPage<SamsScore> getElectiveStudent(Page page, SamsScore samsScore,Integer courseId);

	/**
	 * 修改成绩
	 * @param samsScore
	 * @return
	 */
	R<Boolean> updateScore(SamsScore samsScore);
}
