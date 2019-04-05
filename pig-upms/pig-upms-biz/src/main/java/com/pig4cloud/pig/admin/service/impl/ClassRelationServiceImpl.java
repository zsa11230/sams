/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.admin.mapper.ClassRelationMapper;
import com.pig4cloud.pig.admin.service.ClassRelationService;
import com.pig4cloud.pig.admin.service.SamsStudentArchiveService;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.Calendar;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
@Service
public class ClassRelationServiceImpl extends ServiceImpl<ClassRelationMapper, ClassRelation> implements ClassRelationService {

	@Override
	public R<Boolean> create(ClassRelation classRelation) {
		Integer[] ids=classRelation.getStudentIds();
		if (ids!=null&&ids.length>0){
			for (Integer id:ids){
				classRelation.setStudentId(id);
				baseMapper.insert(classRelation);
			}
		}
		return new R<>(Boolean.TRUE);
	}

	@Override
	public R<Boolean> updateClass(ClassRelation classRelation) {
		baseMapper.updateById(classRelation);
		return new R<>(Boolean.TRUE);
	}
}
