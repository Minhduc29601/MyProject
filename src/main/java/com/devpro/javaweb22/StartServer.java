package com.devpro.javaweb22;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//Annotation
// Nhận biết là 1 ứng dụng Spring-Boot.
@SpringBootApplication
public class StartServer {

	public static void main(String[] args) {
		// chạy ứng dụng Spring-Boot với class StartServer
		SpringApplication.run(StartServer.class, args);
	}
	
}
