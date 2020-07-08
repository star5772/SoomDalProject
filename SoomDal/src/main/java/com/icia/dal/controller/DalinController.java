package com.icia.dal.controller;

import java.io.*;
import java.security.*;

import javax.annotation.*;
import javax.inject.*;
import javax.mail.*;
import javax.servlet.http.*;
import javax.validation.*;
import javax.validation.constraints.*;

import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dto.*;
import com.icia.dal.service.*;


@Controller
public class DalinController {
	
	@Inject
	private DalinService dalService;
	@Inject
	private PaymentService paymentService;
	
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/my_info")
	public ModelAndView myInFo(Principal principal) throws UserNotFoundException {
		// 달인 마이페이지
		System.out.println(SecurityContextHolder.getContext().hashCode());
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","dalin/my_info.jsp").addObject("myInfo",dalService.readToMyInfo(username));
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/dalin/join")
	public ModelAndView dalinJoin() {
		// 달인 회원가입
		return new ModelAndView("main").addObject("viewName","dalin/dalinJoin.jsp");
	}
	@PreAuthorize("isAnonymous()")
	@PostMapping("/dalin/join")
	public String dalinJoin(DalinDto.DtoForJoinToDalin dto,BindingResult br, RedirectAttributes ra) throws BindException {
		if(br.hasErrors()==true)
			throw new BindException(br);
		System.out.println(dto);
		dalService.join(dto);
		ra.addFlashAttribute("msg","회원가입을 축하합니다");
		return "redirect:/member/system/msg";
	}
	
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/resign")
	public ModelAndView dalinResign() {
		// 달인 탈퇴
		return new ModelAndView("main").addObject("viewName","dalin/resign.jsp");
	}
	
	// 달인 프로필 수정
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/profile_update")
	public ModelAndView dalinInFoUpdate(Principal principal) throws DalinNotFoundException {
		//Dalin dalin = dalService.findById(principal.getName());
		return new ModelAndView("main").addObject("viewName","dalin/info_update.jsp").addObject("dalin",dalService.readToMyProfile(principal.getName()));
	}
	
	@Secured("ROLE_DALIN")
	@PostMapping("/dalin/profile_update")
	public String dalinInFoUpdate(@Valid DalinDto.DtoForProfileUpdateToDalin dto, @Nullable MultipartFile dProfile, @Nullable MultipartFile profileAttachment0,@Nullable MultipartFile profileAttachment1,@Nullable MultipartFile profileAttachment2,@Nullable MultipartFile profileAttachment3,@Nullable MultipartFile profileAttachment4,Principal principal, RedirectAttributes ra, BindingResult bindingResult) throws BindException, DalinNotFoundException {
		String dEmail = principal.getName();
		if(bindingResult.hasErrors()==true)
			throw new BindException(bindingResult);
		try {
			dalService.profileUpdate(dto, dProfile, profileAttachment0, profileAttachment1, profileAttachment2,profileAttachment3,profileAttachment4, dEmail);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/my_info_update")
	public ModelAndView dalinMyInFoUpdate(Principal principal) throws UserNotFoundException {
		// 달인 내정보 수정
		return new ModelAndView("main").addObject("viewName","dalin/my_info_update.jsp").addObject("dalinRead", dalService.readToMyInfo(principal.getName()));
	}
	
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/request_list")
	public ModelAndView dalinRequestBoardList() {
		// 달인 요청서 관리
		return new ModelAndView("main").addObject("viewName","dalin/request_board_list.jsp");
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/dalin/field_list")
	public ModelAndView dalinFieldSelect() {
		// 달인 분야선택 (달인 회원가입)
		return new ModelAndView("main").addObject("viewName","dalin/field_select.jsp");
	}
	
	
	@GetMapping("/member/system/msg")
	public ModelAndView msg() {
		return new ModelAndView("main").addObject("viewName","system/msg.jsp");
	}
	// 달인 캐시 사용내역
	
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/usedCashList")
	public ModelAndView useCashPage(@RequestParam(defaultValue = "1")int pageno,Principal principal,int dMno) {
		return new ModelAndView("payment/usedCash").addObject("uc",paymentService.useCashList(pageno, principal.getName(), dMno)).addObject("dMno",dMno);
	}
	
	// 패스워스 찾기
	@PreAuthorize("isAnonymous()")
	@GetMapping("/dalin/change_pwd")
	public ModelAndView resetPassword() {
		return new ModelAndView("main").addObject("viewName","dalin/change_pwd.jsp");
	}
	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/dalin/change_pwd")
	public String resetPassword(@RequestParam @NotNull String dEmail, @RequestParam @NotNull String dTel, RedirectAttributes ra) {
		try {
			dalService.resetPassword(dEmail, dTel);
		} catch (DalinNotFoundException | MessagingException e) {
			e.printStackTrace();
		}
		ra.addFlashAttribute("msg", "가입하신 이메일로 임시비밀번호를 보냈습니다");
		return "redirect:/member/login";
	}
	
	// 달인 마이프로필
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/my_profile")
	public ModelAndView dalinProfileRead(String dEmail,Principal principal) throws DalinNotFoundException {
		return new ModelAndView("main").addObject("viewName","dalin/my_profile.jsp").addObject("readProfile",dalService.readToMyProfile(principal.getName()));
	}
	
	@Secured("ROLE_DALIN")
	@GetMapping("/member/resetToDalinPwd") 
	public ModelAndView resetToDalinPwd() {
		return new ModelAndView("main").addObject("viewName","member/resetToDalinPwd.jsp");
		}
	
	@Secured("ROLE_DALIN")
	@PostMapping("/member/resetToDalinPwd") 
	public String resetToDalinPwd(@RequestParam @NotNull String dPassword, @RequestParam @NotNull String newPassword, String dEmail, RedirectAttributes ra, SecurityContextLogoutHandler handler, HttpServletRequest request, HttpServletResponse response, Authentication authentication ) throws DalinNotFoundException {
		dalService.changePwd(dPassword, newPassword, dEmail);
		ra.addFlashAttribute("msg","비밀번호를 변경했습니다");
		handler.logout(request, response, authentication);
		return "redirect:/";
	  }
	
	@GetMapping("/dalin/report")
	public ModelAndView reportJeja(String jEmail) {
		return new ModelAndView("dalin/report").addObject("jEmail",jEmail);
	}
}
