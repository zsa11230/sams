/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.SamsCourseElective;
import com.pig4cloud.pig.admin.mapper.SamsCourseElectiveMapper;
import com.pig4cloud.pig.admin.service.SamsCourseElectiveService;
import com.pig4cloud.pig.admin.service.SysUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


/**
 * 课程管理表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:58
 */
@Slf4j
@Service
@AllArgsConstructor
public class SamsCourseElectiveServiceImpl extends ServiceImpl<SamsCourseElectiveMapper, SamsCourseElective> implements SamsCourseElectiveService {

	private final SysUserService sysUserService;

	@Override
	public IPage<SamsCourseElective> getStudentpage(Page page, SamsCourseElective samsCoursEelective) {
		Integer userId=sysUserService.getUserId();
			Integer[] courseIds=baseMapper.getStudentCourseCount(userId);
			if (courseIds!=null&&courseIds.length>0){
				for (Integer courserId:courseIds){
					return baseMapper.getStudentCoursePage(page, samsCoursEelective,courserId);
				}
				return null;
			}else{
				return null;
			}
	}
}
