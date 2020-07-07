package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.lang.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dto.*;
import com.icia.dal.service.*;

@Controller
@RequestMapping("/member")
public class RequestBoardController {
	@Inject
	private RequestBoardService service;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/reqboard/read")
	public ModelAndView read(int rbNo, Principal principal) {
		return new ModelAndView("main").addObject("viewName","reqboard/read.jsp").addObject("reqRead",service.read(rbNo, principal.getName()));
	}
	
	@Secured("ROLE_JEJA")
	@GetMapping("/reqboard/write")
	public ModelAndView write() {
		return new ModelAndView("main").addObject("viewName","reqboard/write.jsp");
	}
	
	@Secured("ROLE_JEJA")
	@PostMapping("/reqboard/write")
	public String write(RequestBoardDto.DtoForWrite dto, Principal principal) throws JejaNotFoundException {
		dto.setRbWriter(principal.getName());
		return "redirect:/member/reqboard/read?rbNo=" + service.write(dto);
	}
	
	
	@GetMapping("/reqboard/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int pageno, @Nullable String rbWriter) {
		return new ModelAndView("main").addObject("viewName", "reqboard/list.jsp").addObject("reqPage", service.list(pageno, rbWriter));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/reqboard/report")
	public ModelAndView report(int rbNo) {
		return new ModelAndView("reqboard/report").addObject("rbNo",rbNo);
	}	
}
