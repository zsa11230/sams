/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.SubjectScheduleRelation;

import java.util.List;


/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
public interface SubjectScheduleRelationService extends IService<SubjectScheduleRelation> {

	/**
	 * 通过课程表ID获取该表中的所有课程
	 * @param scheduleId 课程表ID
	 * @return R
	 */
	List<SubjectScheduleRelation> getRelationListByscheduleId(Integer scheduleId);
}
