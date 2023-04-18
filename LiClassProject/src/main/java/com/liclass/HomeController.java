package com.liclass;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liclass.client.classes.service.ClientClassService;

import lombok.Setter;

@Controller
public class HomeController {
	@Setter(onMethod_ = @Autowired)
	private ClientClassService classService;
	
	/************************************************
	 * 1. 홈화면
	 * 요청 url : http://localhost:8080/
	************************************************/
	@RequestMapping("/")
	public String home(Locale locale, Model model,@RequestParam(required = false, defaultValue = "") String payerrormsg) {
		model.addAttribute("payerrormsg",payerrormsg);
		return "home";
	}
	
	/************************************************
	 * 2. 팀 소개 화면
	 * 요청 url : http://localhost:8080/team
	************************************************/
	@GetMapping("/team")
	public String team() {
		return "team";
	}
}
