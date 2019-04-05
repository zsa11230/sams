/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsStudentArchive;
import com.pig4cloud.pig.admin.service.SamsStudentArchiveService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生档案管理表
 *
 * @author LuckyDu
 * @date 2019-03-26 14:48:16
 */
@RestController
@AllArgsConstructor
@RequestMapping("/archives")
public class SamsStudentArchiveController {

  private final SamsStudentArchiveService samsStudentArchivesService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsStudentArchive 学生档案管理表
   * @return
   */
  @GetMapping("/page")
  public R getSamsStudentArchivesManagementPage(Page page, SamsStudentArchive samsStudentArchive) {
    return  new R<>(samsStudentArchivesService.page(page,Wrappers.query(samsStudentArchive)));
  }


  /**
   * 通过id查询学生档案管理表
   * @param id id
   * @return R
   */
  @GetMapping("/get/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(samsStudentArchivesService.getById(id));
  }

  /**
   * 根据当前登录用户获取学生信息
   * @return R
   */
  @GetMapping("/getStudent/{id}")
  public R getStudentById(@PathVariable("id") Integer id){
    return new R<>(samsStudentArchivesService.getStudent(id));
  }

  /*
   * 新增学生档案管理表
   * @param samsStudentArchive 学生档案管理表
   * @return R
   */
  @SysLog("新增学生档案管理表")
  @PostMapping("/create")
  public R save(@RequestBody SamsStudentArchive samsStudentArchive){
    return samsStudentArchivesService.create(samsStudentArchive);
  }

  /**
   * 修改学生档案管理表
   * @param samsStudentArchive 学生档案管理表
   * @return R
   */
  @SysLog("修改学生档案管理表")
  @PostMapping("/update")
  public R updateById(@RequestBody SamsStudentArchive samsStudentArchive){
    return new R<>(samsStudentArchivesService.updateById(samsStudentArchive));
  }

  /**
   * 通过id删除学生档案管理表
   * @param id id
   * @return R
   */
  @SysLog("删除学生档案管理表")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(samsStudentArchivesService.removeById(id));
  }

}
