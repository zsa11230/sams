/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
public interface ClassRelationService extends IService<ClassRelation> {
	/**
	 *将学生添加入班级
	 * @param classRelation
	 * @return
	 */
	R<Boolean> create(ClassRelation classRelation);
	/**
	 * 修改班级
	 * @param classRelation
	 * @return
	 */
	R<Boolean> updateClass(ClassRelation classRelation);
}
