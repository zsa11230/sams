/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.admin.api.entity.StudentSelection;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
public interface StudentSelectionMapper extends BaseMapper<StudentSelection> {

	/**
	 * 获取课程当前的学生总数
	 * @param id
	 * @return
	 */
	Integer getCourseCount(Integer id);
}
