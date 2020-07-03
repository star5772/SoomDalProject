package com.icia.dal.controller;

import javax.inject.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.service.*;
@RequestMapping("/member")
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
		return new ModelAndView("main").addObject("viewName","admin/member_manage.jsp");
	}
	
	@GetMapping("/admin/enabled_manage")
	public ModelAndView enabledManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/enabled_manage.jsp").addObject("enabled",adminService.EnabledPage(pageno));
	}
	
	@GetMapping("/admin/jeja_manage")
	public ModelAndView jejaManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/jeja_manage.jsp").addObject("jeja",adminService.adminPage(pageno));
	}
	
	@GetMapping("/admin/review_manage")
	public ModelAndView reviewManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/review_manage.jsp").addObject("review",adminService.ReviewPage(pageno));
	}
}
