/*
 *      Copyright (c) 2018-2025, rcg All rights reserved.
 */
package com.pig4cloud.pig.admin.service;


import org.springframework.web.multipart.MultipartFile;
import com.pig4cloud.pig.common.core.util.R;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 附件
 *
 * @author rcg
 * @date 2019-03-09 13:43:05
 */
public interface FileService {

	/**
	 * 上传文件
	 * 文件名采用uuid,避免原始文件名中带"-"符号导致下载的时候解析出现异常
	 * @param file 资源
	 * @param request
	 * @return R(bucketName, filename)
	 */
	R<Object> uploadFile(MultipartFile file, HttpServletRequest request);

	/**
	 * 获取文件
	 *
	 * @param fileName 文件空间/名称
	 * @param response
	 * @return
	 */
	void getFileByName(String fileName, HttpServletResponse response);

}
