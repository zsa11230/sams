/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pig4cloud.pig.admin.api.entity.ClassSchedule;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
public interface ClassScheduleMapper extends BaseMapper<ClassSchedule> {

	/**
	 * 根据班级id获取课程表id
	 * @param id
	 * @return
	 */
	Integer getIdByClassId(Integer id);

	/**
	 * 获取所有专业课程list
	 * @param id
	 * @return
	 */
	List<StudentVO> getScheduleByMajor(@Param("id") Integer id);

	/**
	 * 根据学生userId查询课表
	 * @param id
	 * @return
	 */
	ClassSchedule getByUserId(Integer id);

	/**
	 * 根据班级id获取班级成员
	 * @param classId
	 * @return
	 */
	Integer[] getStudentById(Integer classId);


}
