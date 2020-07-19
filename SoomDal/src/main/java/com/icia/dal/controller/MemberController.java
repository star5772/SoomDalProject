package com.icia.dal.controller;


import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;

import org.springframework.lang.Nullable;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.dal.Exception.*;
import com.icia.dal.service.AdminService;
import com.icia.dal.service.DalinService;
import com.icia.dal.service.JejaService;
import com.icia.dal.service.ReviewService;

@Controller
public class MemberController {
	@Inject
	private JejaService jejaService;
	@Inject
	private DalinService dalService;
	@Inject
	private ReviewService reviewService;
	@Inject
	private AdminService adminService;
	
	
	@GetMapping({"/","/root"})
	public ModelAndView main() {
		// main 페이지로 이동 
		return new ModelAndView("main").addObject("viewName","root/rootPage.jsp");
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/member/login")
	public ModelAndView dalinlogin() {
		// 로그인 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/login.jsp");
	}
	

	
	@GetMapping("/request_board/list")
	public ModelAndView requestBoard() {
		// 요청서 게시판으로 이동
		// board/request.jsp에 뿌려줄 list 정보 필요(addObject("request",service.requestList()))
		return new ModelAndView("main").addObject("viewName","board/request_board_list.jsp");
	}

	@PreAuthorize("isAnonymous()")
	@GetMapping("/member/find_id")
	public ModelAndView findId() {
		// 아이디 찾기 페이지로 이동
		return new ModelAndView("member/find_id");
	}
	@PreAuthorize("isAnonymous()")
	@GetMapping("/member/reset_pwd") 
	public ModelAndView resetPwd(){
		// 비번 찾기 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/reset_pwd.jsp");
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/resign")
	public ModelAndView resign() {
		// 회원 탈퇴 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/resign.jsp");
	}
	@PreAuthorize("isAnonymous()")
	@GetMapping("/member/join_select")
	public ModelAndView joinSelect() {
		// 회원가입 버튼 선택 시 제자 or 달인 선택 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/join_select.jsp");
	}

	
	// 달인 프로필 읽기
	@Secured("ROLE_JEJA")
	@GetMapping("/jeja/dalin_profile")
	public ModelAndView dalinProfileRead(int dMno,Principal principal) throws DalinNotFoundException {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","member/dalin_profile_read.jsp").addObject("readProfile",dalService.readToDalinProfile(dMno)).addObject("rvAuth",reviewService.reviewAuth(username,dMno)).addObject("isLh",jejaService.findLessonHistory(dMno));
	}
	
	
	// 세부분야 선택
	@GetMapping("/member/select_detailField")
	public ModelAndView detailFieldSelect(String fNo) {
		return new ModelAndView("main").addObject("viewName","member/detail_field_select.jsp").addObject("detailField",adminService.detailFnameList(fNo));
	}
	
	// 달인 찾기 
	@GetMapping("/member/search")
	public ModelAndView search(@RequestParam(defaultValue = "1") int pageno,@Nullable String searchType,@Nullable String keyword) {
		return new ModelAndView("main").addObject("viewName","member/search.jsp").addObject("search",dalService.dalSearch(pageno,searchType,keyword));
	}
	
	 
	// 회원 탈퇴
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/member/resign")
	public String resign(SecurityContextLogoutHandler handler, HttpServletRequest request, HttpServletResponse response,
															Authentication authentication) throws JejaNotFoundException {
		// 현재 로그인한 유저의 정보(ID)를 제자 테이블에서 찾아서 존재한다면
		if(jejaService.findById(authentication.getName())!=null) {
		// 유저 정보를 모두 삭제하고 로그아웃 시킨후 root 페이지로 리턴	
			jejaService.delete(authentication.getName());
		    handler.logout(request, response, authentication);
		    return "redirect:/";
		// 현재 로그인한 유저의 정보(ID)를 제자테이블에서 찾지 못하고 달인테이블에 존재한다면    
		} else if(dalService.findById(authentication.getName())!=null) {
		// 유저 정보를 모두 삭제하고 로그아웃 시킨후 root 페이지로 리턴	
			dalService.delete(authentication.getName());
		    handler.logout(request, response, authentication);
		    return "redirect:/";
		// 제자/달인 어느테이블에서도 찾지 못했다면 회원탈퇴 페이지로 다시 이동    
		} else
			return "redirect:/dal/member/resign";
	   }
	
}
