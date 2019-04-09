/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import org.apache.ibatis.annotations.Param;

/**
 * 学生档案管理表
 *
 * @author LuckyDu
 * @date 2019-03-26 14:48:16
 */
public interface SamsStudentArchiveMapper extends BaseMapper<SamsStudentArchive> {
	/**
	 * 根据user_id查询学生信息
	 * @param id
	 * @return
	 */
	SamsStudentArchive getStudentById(Integer id);
	/**
	 * 根据user_id查询班级id
	 * @param id
	 * @return
	 */
	Integer getMyClassById(Integer id);
	/**
	 * 获取学生列表
	 * @return
	 */
	IPage<StudentVO> getStudentPage(Page page, @Param("query") SamsStudentArchive samsStudentArchive);

}
