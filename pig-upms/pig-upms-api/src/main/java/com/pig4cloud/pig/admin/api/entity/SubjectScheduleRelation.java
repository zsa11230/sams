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
 * 学生课程表表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
@Data
@TableName("subject_schedule_relation")
@EqualsAndHashCode(callSuper = true)
public class SubjectScheduleRelation extends Model<SubjectScheduleRelation> {
private static final long serialVersionUID = 1L;

    /**
   * 主键ID
   */
    @TableId
    private Integer id;
    /**
   * 课程表ID
   */
    private Integer scheduleId;
    /**
   * 课程ID
   */
    private Integer subjectId;
	/**
	 * 上课时间
	 */
	private Integer subjectTime;
	/**
	 * 0是专业课程，1是选修课程
	 */
	private Integer type;

}
