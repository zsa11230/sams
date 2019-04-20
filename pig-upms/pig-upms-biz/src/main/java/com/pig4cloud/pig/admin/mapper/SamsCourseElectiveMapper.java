/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import org.apache.ibatis.annotations.Param;

/**
 * 课程管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:58
 */
public interface SamsCourseElectiveMapper extends BaseMapper<SamsCourseElective> {
	/**
	 * 通过课程id获取 课程相关信息
	 * @param courseId
	 * @return
	 */
	IPage<SamsCourseElective> getStudentCoursePage(Page page, @Param("query") SamsCourseElective samsCoursEelective, @Param("courseId") Integer courseId);
	/**
	 * 通过用户id查询关联课程id
	 * @param id
	 * @return
	 */
	Integer[] getStudentCourseCount(Integer id);

	/**
	 * 获取我的教学课程分页
	 */
	IPage<SamsCourseElective> getMyElectiveClass(Page page, @Param("query") SamsCourseElective samsCoursEelective, @Param("userId") Integer userId);
}
