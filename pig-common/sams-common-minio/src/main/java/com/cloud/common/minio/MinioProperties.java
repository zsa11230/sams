/*
 *    Copyright (c) 2018-2025, Wilson All rights reserved.
 */

package com.cloud.common.minio;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * minio 配置信息
 *
 * @author Wilson
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "minio")
public class MinioProperties {
	/**
	 * minio 服务地址 http://ip:port
	 */
	private String url;

	/**
	 * 用户名
	 */
	private String accessKey;

	/**
	 * 密码
	 */
	private String secretKey;

}
