/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.service.SamsClassInformationService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 班级信息表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:48
 */
@RestController
@AllArgsConstructor
@RequestMapping("/samsclassinformation")
public class SamsClassInformationController {

  private final SamsClassInformationService samsClassInformationService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsClassInformation 班级信息表
   * @return
   */
  @GetMapping("/page")
  public R getSamsClassInformationPage(Page page, SamsClassInformation samsClassInformation) {
    return  new R<>(samsClassInformationService.page(page,Wrappers.query(samsClassInformation)));
  }


  /**
   * 通过id查询班级信息表
   * @param id id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(samsClassInformationService.getById(id));
  }

  /**
   * 新增班级信息表
   * @param samsClassInformation 班级信息表
   * @return R
   */
  @SysLog("新增班级信息表")
  @PostMapping
  public R save(@RequestBody SamsClassInformation samsClassInformation){
    return new R<>(samsClassInformationService.save(samsClassInformation));
  }

  /**
   * 修改班级信息表
   * @param samsClassInformation 班级信息表
   * @return R
   */
  @SysLog("修改班级信息表")
  @PutMapping
  public R updateById(@RequestBody SamsClassInformation samsClassInformation){
    return new R<>(samsClassInformationService.updateById(samsClassInformation));
  }

  /**
   * 通过id删除班级信息表
   * @param id id
   * @return R
   */
  @SysLog("删除班级信息表")
  @DeleteMapping("/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(samsClassInformationService.removeById(id));
  }

}
