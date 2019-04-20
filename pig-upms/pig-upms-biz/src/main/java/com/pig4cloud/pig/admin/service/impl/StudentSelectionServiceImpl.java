/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.entity.StudentSelection;
import com.pig4cloud.pig.admin.mapper.StudentSelectionMapper;
import com.pig4cloud.pig.admin.service.SamsCourseElectiveService;
import com.pig4cloud.pig.admin.service.StudentSelectionService;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
@Slf4j
@Service
@AllArgsConstructor
public class StudentSelectionServiceImpl extends ServiceImpl<StudentSelectionMapper, StudentSelection> implements StudentSelectionService {

	private final SamsCourseElectiveService samsCourseElectiveService;

	@Override
	public R<Boolean> create(StudentSelection studentSelection) {
		SamsCourseElective courseElective = samsCourseElectiveService.getById(studentSelection.getCourseId());
		Integer number = courseElective.getNumber();
		Integer count = baseMapper.getCourseCount(studentSelection.getCourseId());
		if (count > number) {
			return new R<>(Boolean.FALSE, "满级人数已满!");
		} else {
			baseMapper.insert(studentSelection);
			return new R<>(Boolean.TRUE, "选课成功！");
		}

	}
}
