package com.icia.dal.controller;


import java.security.*;

import javax.inject.*;

import org.springframework.security.web.authentication.logout.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.dal.entity.*;
import com.icia.dal.service.*;

@Controller
public class JejaController {
	@Inject
	private JejaService service;
	
	@GetMapping("/jeja/my_info")
	public ModelAndView jejaInfo(Principal principal) {
		// 제자 마이페이지로 이동
		// 제자 정보 필요
		return new ModelAndView("main").addObject("viewName","jeja/my_info.jsp").addObject("read",service.read(principal.getName()));
	}
	
	@GetMapping("/jeja/my_info_update")
	public ModelAndView jejaUpdate(Principal principal) {
		// 제자 마이페이지 수정 페이지로 이동
		// 제자 마이페이지 정보 필요
		return new ModelAndView("main").addObject("viewName","jeja/my_info_update.jsp").addObject("jejaRead",service.read(principal.getName()));
	}
	
	@GetMapping("/jeja/join")
	public ModelAndView jejaJoin() {
		// 회원가입 구분 페이지에서 제자 누르면 이동하는 페이지
		return new ModelAndView("main").addObject("viewName","jeja/join.jsp");
	}
	@PostMapping("/jeja/join")
	public String jejaJoin(Jeja jeja,BindingResult br,RedirectAttributes ra) throws BindException {
		if(br.hasErrors()==true)
			throw new BindException(br);
		service.join(jeja);
		ra.addFlashAttribute("msg","회원가입을 축하합니다");
		return "redirect:/member/system/msg";
	}
	
	@GetMapping("/jeja/request_write")
	public ModelAndView requestWrite() {
		// 제자가 달인 프로필에서 요청서 작성 버튼 클릭 시 이동하는 페이지
		return new ModelAndView("main").addObject("viewName","jeja/request_write.jsp");
	}
	
	
	
	

}
