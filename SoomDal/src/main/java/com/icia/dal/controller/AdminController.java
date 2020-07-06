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
	// 제자 회원관리
	@GetMapping("/admin/member_manage")
	public ModelAndView adminManage(@RequestParam(defaultValue = "1") int pageno) {
		// 관리자 회원관리탭 - 제자 and 달인 리스트 정보 필요
		return new ModelAndView("main").addObject("viewName","admin/member_manage.jsp").addObject("jeja",adminService.adminPageToJeja(pageno));
	}
	// 달인 회원관리
	@GetMapping("/admin/member_manage_d")
	public ModelAndView adminManageToDalin(@RequestParam(defaultValue = "1")int pagene) {
		return new ModelAndView("main").addObject("viewName","admin/member_manage_dalin.jsp").addObject("dalin",adminService.adminPageToDalin(pagene));
	}
	// 블락회원관리
	@GetMapping("/admin/enabled_manage")
	public ModelAndView enabledManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/enabled_manage.jsp").addObject("enabled",adminService.EnabledPage(pageno));
	}
	// 신고회원관리
	@GetMapping("/admin/jeja_manage")
	public ModelAndView jejaManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/jeja_manage.jsp").addObject("jeja",adminService.reportedPage(pageno));
	}
	// 신고게시물관리
	@GetMapping("/admin/review_manage")
	public ModelAndView reviewManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/review_manage.jsp").addObject("review",adminService.ReviewPage(pageno));
	}
	// 환불관리
	@GetMapping("/admin/refund_manage")
	public ModelAndView refundManage(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","admin/refund_manage.jsp").addObject("refund",adminService.RefundPage(pageno));
	}
}
