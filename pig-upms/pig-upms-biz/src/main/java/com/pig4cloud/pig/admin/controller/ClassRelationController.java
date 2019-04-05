/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.common.core.util.R;
import com.pig4cloud.pig.admin.api.entity.ClassRelation;
import com.pig4cloud.pig.admin.service.ClassRelationService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 学生课程关联表
 *
 * @author LuckyDu
 * @date 2019-04-04 13:51:24
 */
@RestController
@AllArgsConstructor
@RequestMapping("/classrelation")
public class ClassRelationController {

  private final ClassRelationService service;

  /**
   * 分页查询
   * @param page 分页对象
   * @param classRelation 学生课程关联表
   * @return
   */
  @GetMapping("/page")
  public R getClassRelationPage(Page page, ClassRelation classRelation) {
    return  new R<>(service.page(page,Wrappers.query(classRelation)));
  }

  /**
   * 通过id查询学生课程关联表
   * @param id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(service.getById(id));
  }

  /**
   * 新增学生课程关联表
   * @param classRelation 学生课程关联表
   * @return R
   */
  @SysLog("新增学生课程关联表")
  @PostMapping("/create")
  public R save(@RequestBody ClassRelation classRelation){
    return service.create(classRelation);
  }

  /**
   * 修改学生课程关联表
   * @param classRelation 学生课程关联表
   * @return R
   */
  @SysLog("修改学生课程关联表")
  @PostMapping("/update")
  public R updateById(@RequestBody ClassRelation classRelation){
    return service.updateClass(classRelation);
  }

  /**
   * 通过id删除学生课程关联表
   * @param id
   * @return R
   */
  @SysLog("删除学生课程关联表")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(service.removeById(id));
  }

}
