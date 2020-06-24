package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.dto.*;
import com.icia.dal.service.*;

@Controller
public class RequestBoardController {
	@Inject
	private RequestBoardService service;
	
	@GetMapping("/reqboard/read")
	public ModelAndView read(int rbNo, Principal principal) {
		service.read(rbNo, principal.getName());
		return new ModelAndView("main").addObject("viewName","reqboard/read.jsp");
	}
	
	@GetMapping("/reqboard/write")
	public ModelAndView write() {
		return new ModelAndView("main").addObject("viewName","reqboard/write.jsp");
	}
	
	@PostMapping("/reqboard/write")
	public String write(RequestBoardDto.DtoForWrite dto, String rbWriter, Principal principal) {
		dto.setRbWriter(principal.getName());
		return "redirect:/reqboard/read?rbNo=" + service.write(dto);
	}
}
