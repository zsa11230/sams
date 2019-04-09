/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
public interface ClassRelationMapper extends BaseMapper<ClassRelation> {
	/**
	 * 根据课程关联表查询学生
	 * @param id
	 * @return
	 */
	SamsStudentArchive getStudentById(Integer id);

}
