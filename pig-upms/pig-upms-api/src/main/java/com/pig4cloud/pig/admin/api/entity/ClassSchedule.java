/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.api.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
@Data
@TableName("class_schedule")
@EqualsAndHashCode(callSuper = true)
public class ClassSchedule extends Model<ClassSchedule> {
private static final long serialVersionUID = 1L;

    /**
   * 课程表id
   */
    @TableId
    private Integer id;
    /**
   * 课程名表名称
   */
    private String scheduleName;
    /**
   * 关联班级id
   */
    private Integer classId;
    /**
   * 课程id
   */
    private Integer courseId;
  
}
