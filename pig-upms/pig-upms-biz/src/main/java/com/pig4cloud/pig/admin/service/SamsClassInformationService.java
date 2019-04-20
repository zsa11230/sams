/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

/**
 * 班级信息表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:48
 */
public interface SamsClassInformationService extends IService<SamsClassInformation> {
	/**
	 * 新增课程
	 * @param samsClassInformation
	 * @return
	 */
	R create(SamsClassInformation samsClassInformation);
	/**
	 * 获取学生的个人课程
	 * @param page
	 * @param samsClassInformation
	 * @param id
	 * @return
	 */
	Page<SamsClassInformation> getMyClassPage(Page page, SamsClassInformation samsClassInformation, Integer id);
	/**
	 *获取班级的list
	 * @return
	 */
	R<List<SamsClassInformation>> getClassList();

	/**
	 * 获取分页
	 * @param page
	 * @param samsClassInformation
	 * @return
	 */
	Page<SamsClassInformation> getPage(Page page, SamsClassInformation samsClassInformation);
}
