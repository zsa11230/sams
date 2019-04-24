/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.admin.service.SamsCourseElectiveService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

/**
 * 课程管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:58
 */
@RestController
@AllArgsConstructor
@RequestMapping("/course")
public class SamsCourseElectiveController {

  private final SamsCourseElectiveService samsCourseElectiveService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsCoursEelective 课程管理表
   * @return
   */
  @GetMapping("/page")
  public R getSamsCoursePage(Page page, SamsCourseElective samsCoursEelective) {
    return  new R<>(samsCourseElectiveService.page(page,Wrappers.query(samsCoursEelective)));
  }

/**
   * 分页查询
   * @param page 分页对象
   * @param samsCoursEelective 课程管理表
   * @return
   */
  @GetMapping("/personal/page")
  public R<IPage<SamsCourseElective>> getStudentCoursePage(Page page, SamsCourseElective samsCoursEelective) {
    return  new R<>(samsCourseElectiveService.getStudentpage(page, samsCoursEelective));
  }


  /**
   * 通过id查询课程管理表
   * @param id id
   * @return R
   */
  @GetMapping("/{id}")
  public R getById(@PathVariable("id") Integer id){
    return new R<>(samsCourseElectiveService.getById(id));
  }

  /**
   * 新增课程管理表
   * @param samsCoursEelective 课程管理表
   * @return R
   */
  @SysLog("新增课程管理表")
  @PostMapping("/create")
  public R save(@RequestBody SamsCourseElective samsCoursEelective){
    return new R<>(samsCourseElectiveService.save(samsCoursEelective));
  }

  /**
   * 修改课程管理表
   * @param samsCoursEelective 课程管理表
   * @return R
   */
  @SysLog("修改课程管理表")
  @PostMapping("/update")
  public R updateById(@RequestBody SamsCourseElective samsCoursEelective){
    return new R<>(samsCourseElectiveService.updateById(samsCoursEelective));
  }

  /**
   * 通过id删除课程管理表
   * @param id id
   * @return R
   */
  @SysLog("删除课程管理表")
  @PostMapping("/delete/{id}")
  public R removeById(@PathVariable Integer id){
    return new R<>(samsCourseElectiveService.removeById(id));
  }
/**
   * 通过上课时间查询选修课程的列表
   * @param subjectTime
   * @return R
   */
  @SysLog("根据时间查询选修课程")
  @PostMapping("/getElectiveList/{subjectTime}")
  public R<List<StudentVO>> getElectiveList(@PathVariable Integer subjectTime){
    return samsCourseElectiveService.getElectiveList(subjectTime);
  }

}
