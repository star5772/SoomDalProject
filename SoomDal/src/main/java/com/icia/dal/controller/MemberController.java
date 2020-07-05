package com.icia.dal.controller;


import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;

import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
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
import com.icia.dal.entity.Review;
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
		return new ModelAndView("member/find_id");
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

	@GetMapping("/member/join_select")
	public ModelAndView joinSelect() {
		// 회원가입 버튼 선택 시 제자 or 달인 선택 페이지로 이동
		return new ModelAndView("main").addObject("viewName","member/join_select.jsp");
	}

	@DeleteMapping("/member/resign")
	public String resign(SecurityContextLogoutHandler handler, HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		if(jejaService.findById(authentication.getName())!=null) {
			jejaService.delete(authentication.getName());
		    handler.logout(request, response, authentication);
		    return "redirect:/";
		} else if(dalService.findById(authentication.getName())!=null) {
			dalService.delete(authentication.getName());
		    handler.logout(request, response, authentication);
		    return "redirect:/";
		} else
			return "redirect:/dal/member/resign";
	   }
	
	// 달인 프로필 읽기
	@GetMapping("/member/dalin_profile")
	public ModelAndView dalinProfileRead(int dMno,Principal principal) throws DalinNotFoundException {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","member/dalin_profile_read.jsp").addObject("readProfile",dalService.readToDalinProfile(dMno)).addObject("rvAuth",reviewService.reviewAuth(username));
	}
	
	// 제자 리뷰작성
	@PostMapping("/member/reviewWrite")
	public ResponseEntity<List<Review>> reviewWrite(Review rv,Principal principal) {
		String username = principal.getName();
		return ResponseEntity.ok(reviewService.reviewAuthChkAndWrite(rv, username));
	}
	
	@GetMapping("/member/select_detailField")
	public ModelAndView detailFieldSelect(String fNo) {
		return new ModelAndView("main").addObject("viewName","member/detail_field_select.jsp").addObject("detailField",adminService.detailFnameList(fNo));
	}
	
	// 달인 찾기 
	@GetMapping("/member/search")
	public ModelAndView search(@RequestParam(defaultValue = "1") int pageno,@Nullable String searchType,@Nullable String keyword) {
		return new ModelAndView("main").addObject("viewName","member/search.jsp").addObject("search",dalService.dalSearch(pageno,searchType,keyword));
	}
	
	
	  @GetMapping("/dal/member/resetToDalinPwd") 
	  public ModelAndView resetToDalinPwd() {
		  return new ModelAndView("main").addObject("viewName","member/resetToDalinPwd.jsp");
		  }
	  
	  @PostMapping("/dal/member/resetToDalinPwd") 
	  public String resetToDalinPwd(@RequestParam @NotNull String dPassword, @RequestParam @NotNull String newPassword, Principal principal,RedirectAttributes ra) throws DalinNotFoundException {
	  dalService.changePwd(dPassword, newPassword, principal.getName());
	  ra.addFlashAttribute("msg", "비밀번호를 변경했습니다"); 
	  return "redirect:/member/login";
	  }
	 
	
	@GetMapping("/member/resetToJejaPwd")
	public ModelAndView resetToJejaPwd() {
		return new ModelAndView("main").addObject("viewName","member/resetToJejaPwd.jsp");
	}
	
	@PostMapping("/member/resetToJejaPwd")
	public String resetToJejaPwd(@RequestParam @NotNull String jPassword, @RequestParam @NotNull String newPassword, Principal principal, RedirectAttributes ra) throws JejaNotFoundException {
		jejaService.changePwd(jPassword, newPassword, principal.getName());
		ra.addFlashAttribute("msg","비밀번호를 변경했습니다");
		return "redirect:/member/login";
	}
}
