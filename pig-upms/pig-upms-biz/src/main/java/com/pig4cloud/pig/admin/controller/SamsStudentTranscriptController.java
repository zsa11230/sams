/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsStudentTranscript;
import com.pig4cloud.pig.admin.service.SamsStudentTranscriptService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生成绩表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:53
 */
@RestController
@AllArgsConstructor
@RequestMapping("/transcript")
public class SamsStudentTranscriptController {

  private final SamsStudentTranscriptService samsStudentTranscriptService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsStudentTranscript 学生成绩表
   * @return
   */
  @GetMapping("/page")
  public R getSamsStudentTranscriptPage(Page page, SamsStudentTranscript samsStudentTranscript) {
    return  new R<>(samsStudentTranscriptService.page(page,Wrappers.query(samsStudentTranscript)));
  }


  /**
   * 通过id查询学生成绩表
   * @param id id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(samsStudentTranscriptService.getById(id));
  }

  /**
   * 新增学生成绩表
   * @param samsStudentTranscript 学生成绩表
   * @return R
   */
  @SysLog("新增学生成绩表")
  @PostMapping("/create")
  public R save(@RequestBody SamsStudentTranscript samsStudentTranscript){
    return new R<>(samsStudentTranscriptService.save(samsStudentTranscript));
  }

  /**
   * 修改学生成绩表
   * @param samsStudentTranscript 学生成绩表
   * @return R
   */
  @SysLog("修改学生成绩表")
  @PostMapping("/update")
  public R updateById(@RequestBody SamsStudentTranscript samsStudentTranscript){
    return new R<>(samsStudentTranscriptService.updateById(samsStudentTranscript));
  }

  /**
   * 通过id删除学生成绩表
   * @param id id
   * @return R
   */
  @SysLog("删除学生成绩表")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(samsStudentTranscriptService.removeById(id));
  }

}
