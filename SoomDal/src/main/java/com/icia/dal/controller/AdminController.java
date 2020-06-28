package com.icia.dal.controller;

import javax.inject.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.service.*;

@Controller
public class AdminController {
	@Inject
	private AdminService adminService;
	
	@GetMapping("/admin/login")
	public ModelAndView adminLogin() {
		return new ModelAndView("main").addObject("viewName","admin/adminLogin.jsp");
	}
	
	@GetMapping("/admin/member_manage")
	public ModelAndView adminManage(@RequestParam(defaultValue = "1") int pageno) {
		// 관리자 회원관리탭 - 제자 and 달인 리스트 정보 필요
		return new ModelAndView("main").addObject("viewName","admin/member_manage.jsp").addObject("jeja",adminService.adminPage(pageno)).addObject("review",adminService.ReviewPage(pageno))
				.addObject("enabled",adminService.EnabledPage(pageno));
	}
	
	
	/*
	 * @GetMapping("/admin/report_manage") public ModelAndView
	 * reportManage(@RequestParam(defaultValue = "1") int pageno) { return new
	 * ModelAndView("main").addObject("viewName","admin/member_manage.jsp");
	 * 
	 * }
	 */
	
}
