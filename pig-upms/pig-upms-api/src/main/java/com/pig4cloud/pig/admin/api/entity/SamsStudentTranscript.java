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
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 学生成绩表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:53
 */
@Data
@TableName("sams_student_transcript")
@EqualsAndHashCode(callSuper = true)
public class SamsStudentTranscript extends Model<SamsStudentTranscript> {
private static final long serialVersionUID = 1L;

    /**
   * id
   */
    @TableId
    private Integer id;
    /**
   * 学号
   */
    private Integer studentId;
    /**
   * 学期
   */
    private String semester;
    /**
   * 类型（期中/期末）
   */
    private String type;
    /**
   * 课程名称
   */
    private String courseTitle;
    /**
   * 成绩
   */
    private BigDecimal grade;
  
}
