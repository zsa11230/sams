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

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
@Data
@TableName("class_relation")
@EqualsAndHashCode(callSuper = true)
public class ClassRelation extends Model<ClassRelation> {
private static final long serialVersionUID = 1L;

    /**
   * id
   */
    @TableId
    private Integer id;
    /**
   * 班级id
   */
    private Integer classId;
    /**
   * 学生id
   */
    private Integer studentId;
	/**
	 * 获取班级的学生
	 */
	@TableField(exist = false)
	@Transient
	private Integer[] studentIds;
  
}
