package com.example.spring02.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class HomeController {

	@GetMapping("/")
	public String home() {
		log.info("home()");
		return "/users/login";
	}

	@GetMapping("/login")
	public String login() {
		log.info("login()");
		return "login";
	}
}
