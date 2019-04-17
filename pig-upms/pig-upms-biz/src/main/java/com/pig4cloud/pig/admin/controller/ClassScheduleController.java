/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.ClassSchedule;
import com.pig4cloud.pig.admin.service.ClassScheduleService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

/**
 * 学生课程表
 *
 * @author LuckyDu
 * @date 2019-04-14 19:00:16
 */
@RestController
@AllArgsConstructor
@RequestMapping("/schedule")
public class ClassScheduleController {

  private final ClassScheduleService service;

  /**
   * 分页查询
   * @param page 分页对象
   * @param classSchedule 学生课程表
   * @return
   */
  @GetMapping("/page")
  public R getClassSchedulePage(Page page, ClassSchedule classSchedule) {
    return  new R<>(service.page(page,Wrappers.query(classSchedule)));
  }

  /**
   * 通过id查询学生课程表
   * @param id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(service.getById(id));
  }

  /**
   * 新增学生课程表
   * @param classSchedule 学生课程表
   * @return R
   */
  @SysLog("新增学生课程表")
  @PostMapping("/create")
  public R save(@RequestBody ClassSchedule classSchedule){
    return new R<>(service.save(classSchedule));
  }

  /**
   * 修改学生课程表
   * @param classSchedule 学生课程表
   * @return R
   */
  @SysLog("修改学生课程表")
  @PostMapping("/update")
  public R updateById(@RequestBody ClassSchedule classSchedule){
    return new R<>(service.updateById(classSchedule));
  }

  /**
   * 通过id删除学生课程表
   * @param id
   * @return R
   */
  @SysLog("删除学生课程表")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(service.removeById(id));
  }

}
