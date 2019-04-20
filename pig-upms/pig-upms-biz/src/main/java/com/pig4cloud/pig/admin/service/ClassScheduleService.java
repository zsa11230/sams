/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.dto.ClassScheduleDTO;
import com.pig4cloud.pig.admin.api.entity.ClassSchedule;
import com.pig4cloud.pig.admin.api.vo.ClassScheduleVO;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
public interface ClassScheduleService extends IService<ClassSchedule> {

	/**
	 * 新增课程表
	 *
	 * @param id
	 * @return List
	 */
	R<List<ClassScheduleVO>> createClassSchedule(Integer id);

	/**
	 * 课程表中加入专业课
	 *
	 * @param classScheduleDTO
	 * @return Boolean
	 */
	R<List<ClassScheduleVO>> updateByClassSchedule(ClassScheduleDTO classScheduleDTO);

	/**
	 * 获取所有课程表
	 * @param id
	 * @return
	 */
	R<List<ClassScheduleVO>> getClassById(Integer id);

	/**
	 * 获取所有专业课程list
	 * @param classId
	 * @return
	 */
	R<List<StudentVO>> getClassList(Integer classId);
}
