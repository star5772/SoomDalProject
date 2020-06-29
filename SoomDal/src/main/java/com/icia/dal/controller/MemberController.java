package com.icia.dal.controller;


import java.security.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.DalinNotFoundException;
import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.service.AdminService;
import com.icia.dal.service.DalinService;
import com.icia.dal.service.JejaService;
import com.icia.dal.service.ReviewService;

@Controller
public class MemberController {
	@Inject
	private DalinService dalService;
	@Inject
	private JejaService jejaService;
	@Inject
	private ReviewService reviewService;
	@Inject
	private AdminService adminService;
	
	@GetMapping({"/","/root"})
	public ModelAndView main() {
		// main 페이지로 이동 
		return new ModelAndView("main").addObject("viewName","root/rootPage.jsp");
	}
	
	@GetMapping("/member/login")
	public ModelAndView dalinlogin() {
		// 로그인 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/login.jsp");
	}
	
	/*
	 * @GetMapping("/jeja/login") public ModelAndView jejalogin() { // 로그인 페이지로 이동
	 * return new ModelAndView("main").addObject("viewName","member/login.jsp"); }
	 */

	
	@GetMapping("/request_board/list")
	public ModelAndView requestBoard() {
		// 요청서 게시판으로 이동
		// board/request.jsp에 뿌려줄 list 정보 필요(addObject("request",service.requestList()))
		return new ModelAndView("main").addObject("viewName","board/request_board_list.jsp");
	}
	
	@GetMapping("/qna_board/list")
	public ModelAndView qnaBoard() {
		// 문의 게시판으로 이동
		// jsp에 뿌려줄 list 정보 필요 
		return new ModelAndView("main").addObject("viewName","board/qna_board_list.jsp");
	}
	
	@GetMapping("/qna_board/read")
	public ModelAndView qnaRead() {
		// 문의 글 읽기
		// jsp에 작성글 정보 필요 > service.qnaRead()
		return new ModelAndView("main").addObject("viewName","board/qna_board_read.jsp");
	}
	
	@GetMapping("/qna_board/write")
	public ModelAndView qnaWrite() {
		// 문의 게시판 글작성 페이지로 이동
		return new ModelAndView("main").addObject("viewName","board/qna_board_write.jsp");
	}
	/*
	@PostMapping("/qna_board/write")
	public String qnaWrite() {
		// 문의 게시판 글작성 하기 >> 작성 후 자기가 쓴 글 읽기
		// service.qnawrite();
		return "redirect:/qna_board/read?bno="+"글 쓴 번호";
	}
	*/
	@GetMapping("/member/find_id")
	public ModelAndView findId() {
		// 아이디 찾기 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/find_id.jsp");
	}
	
	@GetMapping("/member/reset_pwd") 
	public ModelAndView resetPwd(){
		// 비번 찾기 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/reset_pwd.jsp");
	}
	
	@GetMapping("/member/resign")
	public ModelAndView resign() {
		// 회원 탈퇴 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/resign.jsp");
	}
	@GetMapping("/member/chk_pwd")
	public ModelAndView checkPwd() {
		// 비밀번호 확인 필요한 페이지 이동 시 비밀번호 확인 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/check_pwd.jsp");
	}
	@GetMapping("/member/join_select")
	public ModelAndView joinSelect() {
		// 회원가입 버튼 선택 시 제자 or 달인 선택 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/join_select.jsp");
	}
	

	@DeleteMapping("/member/resign")
	public String resign(SecurityContextLogoutHandler handler, HttpServletRequest request, HttpServletResponse response, Principal principal) throws MembernameExistException {
		// 제자 회원탈퇴
		// 제자,달인 READ없어서 진행불가능.
		/*
		 * String username = authentication.getName();
		 * dalService.delete(authentication.getName());
		 * if(dalService.checkId(username)==false) { dalService.delete(username);
		 * 
		 * } handler.logout(request, response, authentication); return "redirect:/";
		 */
		  
		jejaService.delete(principal.getName());
		return "redirect:/";
	}

	
	// 달인 프로필 읽기
	@GetMapping("/member/dalin_profile")
	public ModelAndView dalinProfileRead(int dMno) throws DalinNotFoundException {
		return new ModelAndView("main").addObject("viewName","member/dalin_profile_read.jsp").addObject("readProfile",dalService.readToDalinProfile(dMno));
	}
	@GetMapping("/member/select_detailField")
	public ModelAndView detailFieldSelect(String fNo) {
		return new ModelAndView("main").addObject("viewName","member/detail_field_select.jsp").addObject("detailField",adminService.detailFnameList(fNo));
	}
}
