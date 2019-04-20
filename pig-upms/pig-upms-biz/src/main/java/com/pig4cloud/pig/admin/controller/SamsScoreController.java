/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.api.entity.SamsCourseMajor;
import com.pig4cloud.pig.admin.api.entity.SamsScore;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.admin.service.SamsScoreService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

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
  public R<IPage<SamsScore>> getSamsScorePage(Page page, SamsScore samsScore) {
    return  new R<>(samsScoreService.getPageList(page,samsScore));
  }

  /**
   * 分页查询
   * @param page 分页对象
   * @param samsCourseMajor 学生成绩管理表
   * @return
   */
  @GetMapping("/major/page")
  public R<IPage<SamsCourseMajor>> getSamsCourseMajorPage(Page page, SamsCourseMajor samsCourseMajor) {
    return new R<>(samsScoreService.getMajorPageList(page,samsCourseMajor));
  }
	/**
	 * 获取课程学生
	 * @param courseId 学生成绩管理表
	 * @return
	 */
	@GetMapping("/major/student")
	public R<IPage<SamsScore>> getMajorStudent(Page page, SamsScore samsScore,Integer courseId) {
		return new R<>(samsScoreService.getMajorStudent(page,samsScore,courseId));
	}
	/**
	 * 获取课程学生
	 * @param courseId 学生成绩管理表
	 * @return
	 */
	@GetMapping("/elective/student")
	public R<IPage<SamsScore>> getElectiveStudent(Page page, SamsScore samsScore,Integer courseId) {
		return new R<>(samsScoreService.getElectiveStudent(page,samsScore,courseId));
	}
  /**
   * 分页查询
   * @param page 分页对象
   * @param courseElective 学生成绩管理表
   * @return
   */
  @GetMapping("/elective/page")
  public R<IPage<SamsCourseElective>> getSamsCourseElectivePage(Page page, SamsCourseElective courseElective) {
    return  new R<>(samsScoreService.getElectivePageList(page,courseElective));
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
    return samsScoreService.updateScore(samsScore);
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
