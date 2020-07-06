package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.dto.*;
import com.icia.dal.service.*;

@Controller
@RequestMapping("/member")
public class RequestBoardController {
	@Inject
	private RequestBoardService service;
	
	@GetMapping("/reqboard/read")
	public ModelAndView read(int rbNo, Principal principal) {
		return new ModelAndView("main").addObject("viewName","reqboard/read.jsp").addObject("reqRead",service.read(rbNo, principal.getName()));
	}
	
	@GetMapping("/reqboard/write")
	public ModelAndView write() {
		return new ModelAndView("main").addObject("viewName","reqboard/write.jsp");
	}
	
	@PostMapping("/reqboard/write")
	public String write(RequestBoardDto.DtoForWrite dto, String rbWriter, Principal principal) {
		System.out.println(dto+"--------------------------------");
		System.out.println(rbWriter+"--------------------------------------");
		System.out.println(principal.getName()+"-------------------------------------------");
		dto.setRbWriter(principal.getName());
		return "redirect:/member/reqboard/read?rbNo=" + service.write(dto);
	}
	
	
	@GetMapping("/reqboard/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int pageno, @Nullable String rbWriter) {
		return new ModelAndView("main").addObject("viewName", "reqboard/list.jsp").addObject("reqPage", service.list(pageno, rbWriter));
	}
	
	@GetMapping("/reqboard/report")
	public ModelAndView report(int rbNo) {
		return new ModelAndView("reqboard/report").addObject("rbNo",rbNo);
	}	
}
