package com.klu.jfsd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
@ComponentScan("com.klu.jfsd")
@SpringBootApplication
public class FmsSdPprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FmsSdPprojectApplication.class, args);
		System.out.println("server is running............");
	}

}
