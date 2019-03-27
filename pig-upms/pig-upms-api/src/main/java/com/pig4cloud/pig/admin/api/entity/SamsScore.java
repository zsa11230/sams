/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.api.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 学生成绩管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:15:02
 */
@Data
@TableName("sams_score")
@EqualsAndHashCode(callSuper = true)
public class SamsScore extends Model<SamsScore> {
private static final long serialVersionUID = 1L;

    /**
   * id
   */
    @TableId
    private Integer id;
    /**
   * 所属课程
   */
    private Integer courseId;
    /**
   * 所属学生
   */
    private Integer studentId;
    /**
   * 考试成绩
   */
    private BigDecimal examGrade;
    /**
   * 平时成绩
   */
    private BigDecimal partGrade;
    /**
   * 期评
   */
    private BigDecimal grade;
  
}
