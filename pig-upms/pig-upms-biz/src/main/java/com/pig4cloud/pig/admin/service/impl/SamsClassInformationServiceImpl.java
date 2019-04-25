/*
 *      Copyright (c) 2018-2025, Wilson All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pig.admin.api.entity.SamsClassInformation;
import com.pig4cloud.pig.admin.api.vo.StudentPageVO;
import com.pig4cloud.pig.admin.mapper.SamsClassInformationMapper;
import com.pig4cloud.pig.admin.service.SamsClassInformationService;
import com.pig4cloud.pig.common.core.util.R;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 班级信息表
 *
 * @author LuckyDu
 * @date 2019-03-27 10:14:48
 */
@Service
public class SamsClassInformationServiceImpl extends ServiceImpl<SamsClassInformationMapper, SamsClassInformation> implements SamsClassInformationService {

	@Override
	public R create(SamsClassInformation samsClassInformation) {
		baseMapper.insert(samsClassInformation);
		return new R<>(samsClassInformation.getId());
	}

	@Override
	public Page<SamsClassInformation> getMyClassPage(Page page, SamsClassInformation samsClassInformation, Integer id) {
		if(id!=null){
			return baseMapper.getMyClassPage(page,samsClassInformation,id);
		}else{
			return null;
		}
	}

	@Override
	public R<List<SamsClassInformation>> getClassList() {
		List<SamsClassInformation> list=baseMapper.getClassList();
			return new R<List<SamsClassInformation>>(list);
	}

	@Override
	public Page<SamsClassInformation> getPage(Page page, SamsClassInformation samsClassInformation) {
		return baseMapper.getPageList(page,samsClassInformation);
	}

	@Override
	public Page<StudentPageVO> getClassInfoId(Page page, StudentPageVO studentPageVO,Integer classId) {
		if (classId!=null){
			return baseMapper.getStudentPageList(page,studentPageVO,classId);
		}else{
			return null;
		}
	}

}
