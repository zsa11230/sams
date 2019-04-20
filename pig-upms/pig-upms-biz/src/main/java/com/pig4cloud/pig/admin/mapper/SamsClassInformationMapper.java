/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 班级信息表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:48
 */
public interface SamsClassInformationMapper extends BaseMapper<SamsClassInformation> {
	/**
	 * 通过用户id获取用户相关课程
	 * @param id
	 * @return
	 */
	Page<SamsClassInformation> getMyClassPage(Page page, @Param("query") SamsClassInformation samsClassInformation, @Param("id") Integer id);
/**
	 * 获取所有课程的list
	 * @return
	 */
	List<SamsClassInformation> getClassList();

	/**
	 * 获取分页
	 * @return
	 */
	Page<SamsClassInformation> getPageList(Page page, @Param("query") SamsClassInformation samsClassInformation);
}
