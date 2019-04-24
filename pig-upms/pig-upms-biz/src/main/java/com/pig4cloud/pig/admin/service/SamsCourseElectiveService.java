/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

/**
 * 课程管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:58
 */
public interface SamsCourseElectiveService extends IService<SamsCourseElective> {
	/**
	 * 获取当前登录用户的课程信息
	 * @param page
	 * @param samsCoursEelective
	 * @return
	 */
	IPage<SamsCourseElective> getStudentpage(Page page, SamsCourseElective samsCoursEelective);

	/**
	 * 根据上课时间查询选修课程
	 * @param subjectTime
	 * @return
	 */
	R<List<StudentVO>> getElectiveList(Integer subjectTime);
}
