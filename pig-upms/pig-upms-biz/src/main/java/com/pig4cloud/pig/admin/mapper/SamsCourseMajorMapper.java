/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import org.apache.ibatis.annotations.Param;

/**
 * 专业课程
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:11
 */
public interface SamsCourseMajorMapper extends BaseMapper<SamsCourseMajor> {

	/**
	 * 获取我的教学课程分页
	 */
	IPage<SamsCourseMajor> getMyMajorClass(Page page, @Param("query") SamsCourseMajor samsCourseMajor, @Param("userId") Integer user);

	/**
	 * 通过课程id查询课程的名称
	 * @param classId
	 * @return
	 */
	String getMyMajorById(Integer classId);
}
