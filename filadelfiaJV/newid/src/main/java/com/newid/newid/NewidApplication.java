package com.newid.newid;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication
public class NewidApplication{

	public static void main(String[] args) {
		SpringApplication.run(NewidApplication.class, args);
	}

}
