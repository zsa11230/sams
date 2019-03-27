/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.api.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 学生档案管理表
 *
 * @author LuckyDu
 * @date 2019-03-26 14:48:16
 */
@Data
@TableName("sams_student_archives")
@EqualsAndHashCode(callSuper = true)
public class SamsStudentArchive extends Model<SamsStudentArchive> {
private static final long serialVersionUID = 1L;

    /**
   * id
   */
    @TableId
    private Integer id;
    /**
   * 学生姓名
   */
    private String realName;
    /**
   * 民族
   */
    private String nation;
    /**
   * 学号
   */
    private Integer studentId;
    /**
   * 性别
   */
    private String sex;
    /**
   * 出生年月
   */
    private LocalDateTime birthDate;
    /**
   * 个人信息
   */
    private String personalInformation;
    /**
   * 个人荣誉
   */
    private String honor;
    /**
   * 联系地址
   */
    private String contactAddress;
    /**
   * 入学日期
   */
    private LocalDateTime enrollment;
  
}
