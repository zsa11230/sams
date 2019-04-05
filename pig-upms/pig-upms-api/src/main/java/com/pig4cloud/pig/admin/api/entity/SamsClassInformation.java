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
 * 班级信息表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:48
 */
@Data
@TableName("sams_class_information")
@EqualsAndHashCode(callSuper = true)
public class SamsClassInformation extends Model<SamsClassInformation> {
private static final long serialVersionUID = 1L;

    /**
   * ID
   */
    @TableId
    private Integer id;
    /**
   * 年级
   */
    private String grade;
	/**
	 * 班级id
	 */
	private Integer classId;
    /**
   * 班级
   */
    private String className;
    /**
   * 年制（学习年限）
   */
    private String yearSystem;
    /**
   * 班主任
   */
    private String headmaster;
    /**
   * 备注
   */
    private String remarks;
    /**
   * 专业
   */
    private String profession;
    /**
   * 学期
   */
    private String semester;
    /**
   * 所属学院
   */
    private String title;
  
}
