package com.icia.dal.controller;


import java.security.Principal;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dal.Exception.JejaNotFoundException;
import com.icia.dal.entity.Jeja;
import com.icia.dal.service.JejaService;
import com.icia.dal.service.ReviewService;

@Controller
public class JejaController {
	@Inject
	private JejaService service;
	@Inject
	private ReviewService rvService;
	
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
	
	// 제자 회원가입
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
	
	// 레슨 목록리스트
	@GetMapping("/jeja/lessonList")
	public ModelAndView listToLesson(@RequestParam(defaultValue = "1")int pageno,int jMno,Principal principal) {
		return new ModelAndView("main").addObject("viewName","member/lessonHistory.jsp").addObject("LHlist", service.lessonListToJeja(pageno, jMno)).addObject("jMno",jMno);
	}
	
	// 비번 찾기
	@GetMapping("/jeja/change_pwd")
	public ModelAndView resetPassword() {
		return new ModelAndView("main").addObject("viewName","jeja/change_pwd.jsp");
	}
	// 비번 찾기
	@PostMapping("/jeja/change_pwd")
	public String resetPassword(@RequestParam @NotNull String jEmail, @RequestParam @NotNull String jTel, RedirectAttributes ra) {
		try {
			service.resetPassword(jEmail, jTel);
		} catch (JejaNotFoundException | MessagingException e) {
			e.printStackTrace();
		}
		ra.addFlashAttribute("msg","가입하신 이메일로 임시비밀번호를 보냈습니다");
		return "redirect:/member/login";
	}
}
