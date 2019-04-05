/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生档案管理表
 *
 * @author LuckyDu
 * @date 2019-03-26 14:48:16
 */
public interface SamsStudentArchiveService extends IService<SamsStudentArchive> {

	/**
	 * 新增学生档案
	 * @param samsStudentArchive
	 * @return
	 */
	R<Boolean> create(SamsStudentArchive samsStudentArchive);

	/**
	 * 根据user_id获取个人信息
	 * @return
	 */
	SamsStudentArchive getStudent(Integer id);
}
