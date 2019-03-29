/*
 *    Copyright (c) 2018-2025, Wilson All rights reserved.
 */

package com.cloud.common.minio;

import com.cloud.common.minio.service.MinioTemplate;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * minio 自动配置类
 *
 * @author Wilson
 */
@AllArgsConstructor
@EnableConfigurationProperties({MinioProperties.class})
public class MinioAutoConfiguration {
	private final MinioProperties properties;

	@Bean
	@ConditionalOnMissingBean(MinioTemplate.class)
	@ConditionalOnProperty(name = "minio.url")
	MinioTemplate template() {
		return new MinioTemplate(
				properties.getUrl(),
				properties.getAccessKey(),
				properties.getSecretKey()
		);
	}

}
