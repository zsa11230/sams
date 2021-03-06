/*
 *    Copyright (c) 2018-2025, Wilson All rights reserved.
 */

package com.cloud.common.minio.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import io.minio.ObjectStat;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 存储对象的元数据
 *
 * @author Wilson
 */
@Data
@AllArgsConstructor
public class MinioObject {
	private String bucketName;
	private String name;
	private Date createdTime;
	private Long length;
	private String etag;
	private String contentType;
	private Map<String, List<String>> httpHeaders;
	public MinioObject(ObjectStat os) {
		this.bucketName = os.bucketName();
		this.name = os.name();
		this.createdTime = os.createdTime();
		this.length = os.length();
		this.etag = os.etag();
		this.contentType = os.contentType();
		this.httpHeaders = os.httpHeaders();
	}

}

