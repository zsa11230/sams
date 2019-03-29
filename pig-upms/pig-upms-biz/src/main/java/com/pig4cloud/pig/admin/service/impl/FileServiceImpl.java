/*
 *      Copyright (c) 2018-2025, rcg All rights reserved.
 */
package com.pig4cloud.pig.admin.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.cloud.common.minio.service.MinioTemplate;
import com.pig4cloud.pig.admin.service.FileService;
import com.pig4cloud.pig.common.core.constant.CommonConstants;
import com.pig4cloud.pig.common.core.util.R;
import com.pig4cloud.pig.common.security.util.SecurityUtils;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.pig4cloud.pig.common.core.util.R;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;


/**
 * 附件
 *
 * @author rcg
 * @date 2019-03-09 13:43:05
 */
@Slf4j
@Service
@AllArgsConstructor
public class FileServiceImpl implements FileService {

	private final MinioTemplate minioTemplate;


	@Override
	public R<Object> uploadFile(MultipartFile file, HttpServletRequest request) {

		String fileName = IdUtil.simpleUUID()+ StrUtil.DOT+ FileUtil.extName(file.getOriginalFilename());
		Map<String, String> resultMap = new HashMap<>(4);
		resultMap.put("bucketName", "files");
		resultMap.put("fileName", fileName);

		try {
			minioTemplate.putObject("files", fileName, file.getInputStream());
		} catch (Exception e) {
			log.error("上传失败", e);
			return R.builder().code(CommonConstants.FAIL)
					.msg(e.getLocalizedMessage()).build();
		}
		return R.builder().data(resultMap).build();

	}

	@Override
	public void getFileByName(String fileName, HttpServletResponse response) {
		String[] nameArray = StrUtil.split(fileName, StrUtil.DASHED);
		try (InputStream inputStream = minioTemplate.getObject(nameArray[0], nameArray[1])) {
			response.setContentType("application/octet-stream; charset=UTF-8");
			IoUtil.copy(inputStream, response.getOutputStream());
		} catch (Exception e) {
			log.error("文件读取异常", e);
		}
	}

}
