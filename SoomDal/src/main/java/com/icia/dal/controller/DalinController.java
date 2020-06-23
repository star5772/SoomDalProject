package com.icia.dal.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class DalinController {
		
	@GetMapping("/dalin/my_info")
	public ModelAndView myInFo() {
		// 달인 마이페이지
		return new ModelAndView("main").addObject("viewName","dalin/my_info.jsp");
	}
	
	@GetMapping("/dalin/join")
	public ModelAndView dalinJoin() {
		// 달인 회원가입
		return new ModelAndView("main").addObject("viewName","dalin/join.jsp");
	}
	
	@GetMapping("/dalin/resign")
	public ModelAndView dalinResign() {
		// 달인 탈퇴
		return new ModelAndView("main").addObject("viewName","dalin/resign.jsp");
	}
	
	@GetMapping("/dalin_info/update")
	public ModelAndView dalinInFoUpdate() {
		// 달인 프로필 수정
		return new ModelAndView("main").addObject("viewName","dalin/dal_info_update.jsp");
	}
	
	@GetMapping("/dalin/update")
	public ModelAndView dalinMyInFoUpdate() {
		// 달인 내정보 수정
		return new ModelAndView("main").addObject("viewName","dalin/dalin_my_info_update.jsp");
	}
	
	@GetMapping("/dalin_estimate/write")
	public ModelAndView dalinEstimateWrite() {
		// 달인 견적서 작성
		return new ModelAndView("main").addObject("viewName","dalin/dal_estimate_write.jsp");
	}
	
	@GetMapping("/dalin_estimate/list")
	public ModelAndView dalinEstimateList() {
		// 달인 쪽지관리(견적서)
		return new ModelAndView("main").addObject("viewName","dalin/dal_estimate_list.jsp");
	}
	
	@GetMapping("/dalin_request/list")
	public ModelAndView dalinRequestBoardList() {
		// 달인 요청서 관리
		return new ModelAndView("main").addObject("viewName","dalin/dal_request_board_list.jsp");
	}
	
	@GetMapping("/dalin_field/list")
	public ModelAndView dalinFieldSelect() {
		// 달인 분야선택 (달인 회원가입)
		return new ModelAndView("main").addObject("viewName","dalin/dal_field_select.jsp");
	}
	
	
}
