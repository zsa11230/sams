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
 * 专业课程
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:11
 */
@Data
@TableName("sams_course_major")
@EqualsAndHashCode(callSuper = true)
public class SamsCourseMajor extends Model<SamsCourseMajor> {
private static final long serialVersionUID = 1L;

    /**
   * 专业课程id
   */
    @TableId
    private Integer id;
    /**
   * 课程名称
   */
    private String courseName;
    /**
   * 课程老师
   */
    private String courseTeacher;
    /**
   * 课程类型
   */
    private String courseType;
    /**
   * 学分
   */
    private String credits;
    /**
   * 关联班级id
   */
    private Integer classId;
	/**
	 * 所属班级
	 */
	@TableField(exist = false)
	@Transient
	private String className;
  
}
