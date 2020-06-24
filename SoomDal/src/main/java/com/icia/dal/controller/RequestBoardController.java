package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.service.*;

@Controller
public class RequestBoardController {
	@Inject
	private RequestBoardService service;
	
	@GetMapping("/reqboard/read")
	public ModelAndView read(int rbNo, Principal principal) {
		service.read(rbNo, principal.getName());
		System.out.println(rbNo+"----------------------------------------------------------------------------------------");
		return new ModelAndView("main").addObject("viewName","reqboard/read.jsp");
	}
}
