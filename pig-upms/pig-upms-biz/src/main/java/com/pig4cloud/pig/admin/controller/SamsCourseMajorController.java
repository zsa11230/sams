/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import com.pig4cloud.pig.admin.service.SamsCourseMajorService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 专业课程
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:11
 */
@RestController
@AllArgsConstructor
@RequestMapping("/major")
public class SamsCourseMajorController {

  private final SamsCourseMajorService service;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsCourseMajor 专业课程
   * @return
   */
  @GetMapping("/page")
  public R getSamsCourseMajorPage(Page page, SamsCourseMajor samsCourseMajor) {
    return  new R<>(service.page(page,Wrappers.query(samsCourseMajor)));
  }

  /**
   * 通过id查询专业课程
   * @param id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(service.getById(id));
  }

  /**
   * 新增专业课程
   * @param samsCourseMajor 专业课程
   * @return R
   */
  @SysLog("新增专业课程")
  @PostMapping("/create")
  public R save(@RequestBody SamsCourseMajor samsCourseMajor){
    return new R<>(service.save(samsCourseMajor));
  }

  /**
   * 修改专业课程
   * @param samsCourseMajor 专业课程
   * @return R
   */
  @SysLog("修改专业课程")
  @PostMapping("/update")
  public R updateById(@RequestBody SamsCourseMajor samsCourseMajor){
    return new R<>(service.updateById(samsCourseMajor));
  }

  /**
   * 通过id删除专业课程
   * @param id
   * @return R
   */
  @SysLog("删除专业课程")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(service.removeById(id));
  }

}
