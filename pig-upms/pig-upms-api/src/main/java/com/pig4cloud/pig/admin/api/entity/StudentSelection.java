/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.api.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.Transient;

/**
 * 学生选课关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
@Data
@TableName("student_selection")
@EqualsAndHashCode(callSuper = true)
public class StudentSelection extends Model<StudentSelection> {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer id;
	/**
	 * 学生id
	 */
	private Integer userId;
	/**
	 * 课程id
	 */
	private Integer courseId;
	/**
	 * 学生所属班级
	 */
	private Integer classId;


}
