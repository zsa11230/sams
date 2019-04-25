/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.admin.mapper.ClassRelationMapper;
import com.pig4cloud.pig.admin.mapper.SamsStudentArchiveMapper;
import com.pig4cloud.pig.admin.service.ClassRelationService;
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

	private final ClassRelationMapper classRelationMapper;

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
			SamsStudentArchive student=baseMapper.getStudentById(id);
			Integer classId=baseMapper.getMyClassById(id);
			student.setClassId(classId);
			return student;
		}
	}

	@Override
	public IPage<StudentVO> getStudentPage(Page page, SamsStudentArchive samsStudentArchive) {
		return baseMapper.getStudentPage(page,samsStudentArchive);
	}

	@Override
	public R deleteById(Integer id) {
		if (id!=null){
			Integer relationId =baseMapper.getStudentRelation(id);
			if (relationId!=null){
				classRelationMapper.deleteById(relationId);
			}
			baseMapper.deleteById(id);
			return new R<>(Boolean.TRUE,"删除成功！");

		}else{
			return null;
		}
	}

}
