/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.api.entity.StudentSelection;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
public interface StudentSelectionService extends IService<StudentSelection> {
	/**
	 * 新增
	 * @param studentSelection
	 * @return
	 */
	R<Boolean> create(StudentSelection studentSelection);
}
