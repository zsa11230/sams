/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.admin.mapper.SamsStudentArchiveMapper;
import com.pig4cloud.pig.admin.service.SamsStudentArchiveService;
import com.pig4cloud.pig.admin.service.SysUserService;
import com.pig4cloud.pig.common.core.util.R;
import com.pig4cloud.pig.common.security.util.SecurityUtils;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.Calendar;

/**
 * 学生档案管理表
 *
 * @author LuckyDu
 * @date 2019-03-26 14:48:16
 */
@Slf4j
@Service
@AllArgsConstructor
public class SamsStudentArchiveServiceImpl extends ServiceImpl<SamsStudentArchiveMapper, SamsStudentArchive> implements SamsStudentArchiveService {

	@Override
	public R<Boolean> create(SamsStudentArchive samsStudentArchive) {
		baseMapper.insert(samsStudentArchive);
		return new R<>(Boolean.TRUE);
	}

	@Override
	public SamsStudentArchive getStudent(Integer id) {
		if (id!=null){
			SamsStudentArchive studentArchive=baseMapper.getStudentById(id);
			Integer classId=baseMapper.getMyClassById(id);
			studentArchive.setClassId(classId);
			return studentArchive;
		}else{
			SamsStudentArchive student=baseMapper.getStudentById(SecurityUtils.getUser().getId());
			Integer classId=baseMapper.getMyClassById(id);
			student.setClassId(classId);
			return student;
		}
	}

}
