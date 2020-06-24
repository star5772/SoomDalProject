package com.icia.dal.controller;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.entity.*;
import com.icia.dal.service.*;

@Controller
public class JejaController {
	@Inject
	private JejaService service;
	
	@GetMapping("/jeja/my_info")
	public ModelAndView jejaInfo() {
		// 제자 마이페이지로 이동
		// 제자 정보 필요
		return new ModelAndView("main").addObject("viewName","jeja/my_info.jsp");
	}
	
	@GetMapping("/jeja/my_info_update")
	public ModelAndView jejaUpdate() {
		// 제자 마이페이지 수정 페이지로 이동
		// 제자 마이페이지 정보 필요
		return new ModelAndView("main").addObject("viewName","jeja/my_info_update.jsp");
	}
	
	@GetMapping("/jeja/join")
	public ModelAndView jejaJoin() {
		// 회원가입 구분 페이지에서 제자 누르면 이동하는 페이지
		return new ModelAndView("main").addObject("viewName","jeja/join.jsp");
	}
	@PostMapping("/jeja/join")
	public String jejaJoin(Jeja jeja) {
		service.join(jeja);
		return "redirect:/";
	}
	
	@GetMapping("/jeja/request_write")
	public ModelAndView requestWrite() {
		// 제자가 달인 프로필에서 요청서 작성 버튼 클릭 시 이동하는 페이지
		return new ModelAndView("main").addObject("viewName","jeja/request_write.jsp");
	}
	
	@GetMapping("/jeja/request_list")
	public ModelAndView jejaRequestList() {
		// 제자가 요청서탭 클릭 시 요청서 리스트를 보는 페이지로 이동
		// 해당 제자의 요청서 정보 필요
		return new ModelAndView("main").addObject("viewName","jeja/request_list.jsp");
	}
	
	@GetMapping("/jeja/estimate_list")
	public ModelAndView jejaEstimateList() {
		// 제자가 견적서탭 클릭 시 견적서 리스트를 보는 페이지로 이동
		// 해당 제자가 받은 요청 정보 필요
		return new ModelAndView("main").addObject("viewName","jeja/estimate_list.jsp");
	}
	
}
