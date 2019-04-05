/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsCourse;
import com.pig4cloud.pig.admin.service.SamsCourseService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 课程管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:58
 */
@RestController
@AllArgsConstructor
@RequestMapping("/course")
public class SamsCourseController {

  private final SamsCourseService samsCourseService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsCourse 课程管理表
   * @return
   */
  @GetMapping("/page")
  public R getSamsCoursePage(Page page, SamsCourse samsCourse) {
    return  new R<>(samsCourseService.page(page,Wrappers.query(samsCourse)));
  }


  /**
   * 通过id查询课程管理表
   * @param id id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(samsCourseService.getById(id));
  }

  /**
   * 新增课程管理表
   * @param samsCourse 课程管理表
   * @return R
   */
  @SysLog("新增课程管理表")
  @PostMapping
  public R save(@RequestBody SamsCourse samsCourse){
    return new R<>(samsCourseService.save(samsCourse));
  }

  /**
   * 修改课程管理表
   * @param samsCourse 课程管理表
   * @return R
   */
  @SysLog("修改课程管理表")
  @PutMapping
  public R updateById(@RequestBody SamsCourse samsCourse){
    return new R<>(samsCourseService.updateById(samsCourse));
  }

  /**
   * 通过id删除课程管理表
   * @param id id
   * @return R
   */
  @SysLog("删除课程管理表")
  @DeleteMapping("/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(samsCourseService.removeById(id));
  }

}
