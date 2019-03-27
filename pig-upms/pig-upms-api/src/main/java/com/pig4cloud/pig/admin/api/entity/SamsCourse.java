/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.api.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 课程管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:58
 */
@Data
@TableName("sams_course")
@EqualsAndHashCode(callSuper = true)
public class SamsCourse extends Model<SamsCourse> {
private static final long serialVersionUID = 1L;

    /**
   * id
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
   * 教学时长
   */
    private Integer duration;
    /**
   * 课程人数
   */
    private Integer number;
    /**
   * 课程类型
   */
    private String courseType;
    /**
   * 学分
   */
    private Integer credits;
  
}
