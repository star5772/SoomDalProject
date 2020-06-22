package com.icia.dal.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class MemberController {
	
	@GetMapping("/")
	public ModelAndView main() {
		// main 페이지로 이동
		return new ModelAndView("main").addObject("viewName","root/rootPage.jsp");
	}
	
	@GetMapping("/member/login")
	public ModelAndView login() {
		// 로그인 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/login.jsp");
	}
	
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
	
}
