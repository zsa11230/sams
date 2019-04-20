/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.dto.ClassScheduleDTO;
import com.pig4cloud.pig.admin.api.entity.ClassSchedule;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.api.entity.SubjectScheduleRelation;
import com.pig4cloud.pig.admin.api.vo.ClassScheduleVO;
import com.pig4cloud.pig.admin.mapper.ClassScheduleMapper;
import com.pig4cloud.pig.admin.mapper.SubjectScheduleRelationMapper;
import com.pig4cloud.pig.admin.service.ClassScheduleService;
import com.pig4cloud.pig.admin.service.SamsClassInformationService;
import com.pig4cloud.pig.admin.service.SubjectScheduleRelationService;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
@Slf4j
@Service
@AllArgsConstructor
public class SubjectScheduleRelationServiceImpl extends ServiceImpl<SubjectScheduleRelationMapper, SubjectScheduleRelation> implements SubjectScheduleRelationService {

	@Override
	public List<SubjectScheduleRelation> getRelationListByscheduleId(Integer scheduleId) {
		QueryWrapper<SubjectScheduleRelation> qw=new QueryWrapper<>();
		qw.eq("schedule_id", scheduleId);
		return baseMapper.selectList(qw);
	}
}
