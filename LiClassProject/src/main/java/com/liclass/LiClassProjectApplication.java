package com.liclass;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class LiClassProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(LiClassProjectApplication.class, args);
	}

}
