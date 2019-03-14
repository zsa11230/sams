package com.luckydu.sams;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.luckydu.sams.mapper")
@ComponentScan(basePackages = {
		"com.luckydu.sams.config",
		"com.luckydu.sams.controller",
		"com.luckydu.sams.services"})
public class SamsApplication {

	public static void main(String[] args) {
		SpringApplication.run(SamsApplication.class, args);
	}
}
