/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.api.entity.SamsScore;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学生成绩管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:15:02
 */
public interface SamsScoreMapper extends BaseMapper<SamsScore> {

	/**
	 * 获取分页
	 * @return
	 */
	Page<SamsScore> getPageList(Page page, @Param("query") SamsScore samsScore,@Param("userId") Integer userId);
	/**
	 * 根据专业课程id查询课程内的学生
	 * @param courseId
	 */
	Page<SamsScore> getStudentByMajor(Page page, @Param("query") SamsScore samsScore,@Param("courseId")Integer courseId);
	/**
	 * 根据专业课程id查询课程内的学生
	 * @param courseId
	 */
	Page<SamsScore> getStudentByElective(Page page, @Param("query") SamsScore samsScore,@Param("courseId")Integer courseId);
}
