package com.icia.dal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@GetMapping("/admin/login")
	public ModelAndView adminLogin() {
		return new ModelAndView("main").addObject("viewName","admin/adminLogin.jsp");
	}
}
