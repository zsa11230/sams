/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsScore;
import com.pig4cloud.pig.admin.service.SamsScoreService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生成绩管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:15:02
 */
@RestController
@AllArgsConstructor
@RequestMapping("/score")
public class SamsScoreController {

  private final SamsScoreService samsScoreService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsScore 学生成绩管理表
   * @return
   */
  @GetMapping("/page")
  public R getSamsScorePage(Page page, SamsScore samsScore) {
    return  new R<>(samsScoreService.page(page,Wrappers.query(samsScore)));
  }


  /**
   * 通过id查询学生成绩管理表
   * @param id id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(samsScoreService.getById(id));
  }

  /**
   * 新增学生成绩管理表
   * @param samsScore 学生成绩管理表
   * @return R
   */
  @SysLog("新增学生成绩管理表")
  @PostMapping("/create")
  public R save(@RequestBody SamsScore samsScore){
    return new R<>(samsScoreService.save(samsScore));
  }

  /**
   * 修改学生成绩管理表
   * @param samsScore 学生成绩管理表
   * @return R
   */
  @SysLog("修改学生成绩管理表")
  @PostMapping("/update")
  public R updateById(@RequestBody SamsScore samsScore){
    return new R<>(samsScoreService.updateById(samsScore));
  }

  /**
   * 通过id删除学生成绩管理表
   * @param id id
   * @return R
   */
  @SysLog("删除学生成绩管理表")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(samsScoreService.removeById(id));
  }

}
