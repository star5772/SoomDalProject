package com.icia.dal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FuckingController {
	
	@GetMapping("/")
	public ModelAndView fuck() {
		return new ModelAndView("main").addObject("viewName","root/rootPage.jsp");
	}
}
