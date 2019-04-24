/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.dto.ClassScheduleDTO;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.api.entity.StudentSelection;
import com.pig4cloud.pig.admin.api.vo.ClassScheduleVO;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
public interface StudentSelectionService extends IService<StudentSelection> {
	/**
	 * 新增
	 * @return
	 */
	R<Boolean> create();

	/**
	 * 更新学生课程表
	 * @param courseId
	 * @return
	 */
	R updateCourse(ClassScheduleDTO classScheduleDTO);

	/**
	 * 获取学生课程表
	 * @return
	 */
	R<List<ClassScheduleVO>> getSchedule();
}
