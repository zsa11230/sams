/*
 *    Copyright (c) 2018-2025, rcg All rights reserved.
 */

package com.pig4cloud.pig.admin.controller;


import com.pig4cloud.pig.admin.service.FileService;
import com.pig4cloud.pig.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author RCG
 * @date 2019-3-20
 * <p>
 * 文件管理
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/file")
public class FileController {

	private final FileService fileService;

	/**
	 * 上传文件
	 * 文件名采用uuid,避免原始文件名中带"-"符号导致下载的时候解析出现异常
	 * @param file 资源
	 * @return R(bucketName, filename)
	 */
	@PostMapping("/upload")
	public R<Object> upload(@RequestParam("file") MultipartFile file , HttpServletRequest request) {
		return fileService.uploadFile(file,request);
	}

	/**
	 * 获取文件
	 *
	 * @param fileName 文件空间/名称
	 * @param response
	 * @return
	 */
	@GetMapping("/{fileName}")
	public void file(@PathVariable String fileName, HttpServletResponse response) {
		fileService.getFileByName(fileName,response);
	}

}
