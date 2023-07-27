package com.acorn.soso;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource(value = "classpath:custom.properties")
public class SosoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SosoApplication.class, args);
	}

}
