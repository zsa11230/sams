/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.controller;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pig.admin.api.dto.ClassScheduleDTO;
import com.pig4cloud.pig.admin.api.entity.ClassSchedule;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.api.vo.ClassScheduleVO;
import com.pig4cloud.pig.admin.api.vo.StudentVO;
import com.pig4cloud.pig.admin.service.ClassScheduleService;
import com.pig4cloud.pig.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;
import com.pig4cloud.pig.common.core.util.R;

import java.util.List;

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
	 * 查询所有专业课程list
	 * @return R
	 */
	@PostMapping("/list/{classId}")
	public R<List<StudentVO>> getList(@PathVariable("classId") Integer classId){
		return service.getClassList(classId);
	}


	/**
   * 通过id查询学生课程表
   * @param id
   * @return R
   */
  @GetMapping("/{id}")
  public R<List<ClassScheduleVO>> getById(@PathVariable("id") Integer id){
    return service.getClassById(id);
  }


  /**
   * 新增学生课程表
   * @param id 学生课程表
   * @return R
   */
  @SysLog("新增学生课程表")
  @PostMapping("/create/{id}")
  public R<List<ClassScheduleVO>> save(@PathVariable Integer id){ return service.createClassSchedule(id); }

  /**
   * 修改学生课程表
   * @param classScheduleDTO 学生课程表
   * @return R
   */
  @SysLog("修改学生课程表")
  @PostMapping("/update")
  public R<List<ClassScheduleVO>> updateById(@RequestBody ClassScheduleDTO classScheduleDTO){
    return service.updateByClassSchedule(classScheduleDTO);
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
