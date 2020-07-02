package com.icia.dal.controller;

import java.io.*;
import java.security.*;

import javax.annotation.*;
import javax.inject.*;
import javax.validation.*;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.DalinDto.*;
import com.icia.dal.entity.*;
import com.icia.dal.service.*;

@Controller
public class DalinController {
	
	@Inject
	private DalinService dalService;
	@Inject
	private PaymentService paymentService;
	
	@GetMapping("/dalin/my_info")
	public ModelAndView myInFo(Principal principal) throws UserNotFoundException {
		// 달인 마이페이지
		System.out.println(SecurityContextHolder.getContext().hashCode());
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","dalin/my_info.jsp").addObject("myInfo",dalService.readToMyInfo(username));
	}
	
	@GetMapping("/dalin/join")
	public ModelAndView dalinJoin() {
		// 달인 회원가입
		return new ModelAndView("main").addObject("viewName","dalin/dalinJoin.jsp");
	}
	@PostMapping("/dalin/join")
	public String dalinJoin(DalinDto.DtoForJoinToDalin dto,BindingResult br, RedirectAttributes ra) throws BindException {
		if(br.hasErrors()==true)
			throw new BindException(br);
		System.out.println(dto);
		dalService.join(dto);
		ra.addFlashAttribute("msg","회원가입을 축하합니다");
		return "redirect:/member/system/msg";
	}
	
	@GetMapping("/dalin/resign")
	public ModelAndView dalinResign() {
		// 달인 탈퇴
		return new ModelAndView("main").addObject("viewName","dalin/resign.jsp");
	}
	
	@GetMapping("/dalin/profile_update")
	public ModelAndView dalinInFoUpdate(Principal principal, DtoForUpdateToDalin dto, MultipartFile sajin ) throws DalinNotFoundException {
		Dalin dalin = dalService.findById(principal.getName());
		return new ModelAndView("main").addObject("viewName","dalin/info_update.jsp").addObject("dalin",dalService.readToDalinProfile(dalin.getDMno()));
	}
	
	@PostMapping("/dalin/profile_update")
	public String dalinInFoUpdate(@Valid DalinDto.DtoForProfileToDalin dto, @Nullable MultipartFile sajins, RedirectAttributes ra, BindingResult bindingResult) throws BindException {
		if(bindingResult.hasErrors()==true)
			throw new BindException(bindingResult);
		try {
			dalService.profileSajin(dto, sajins);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	@GetMapping("/dalin/my_info_update")
	public ModelAndView dalinMyInFoUpdate(Principal principal) throws UserNotFoundException {
		// 달인 내정보 수정
		return new ModelAndView("main").addObject("viewName","dalin/my_info_update.jsp").addObject("dalinRead", dalService.readToMyInfo(principal.getName()));
	}
	
	
	@GetMapping("/dalin/request_list")
	public ModelAndView dalinRequestBoardList() {
		// 달인 요청서 관리
		return new ModelAndView("main").addObject("viewName","dalin/request_board_list.jsp");
	}
	
	@GetMapping("/dalin/field_list")
	public ModelAndView dalinFieldSelect() {
		// 달인 분야선택 (달인 회원가입)
		return new ModelAndView("main").addObject("viewName","dalin/field_select.jsp");
	}
	
	@GetMapping("/member/system/msg")
	public ModelAndView msg() {
		return new ModelAndView("main").addObject("viewName","system/msg.jsp");
	}
	@GetMapping("/dalin/usedCashList")
	public ModelAndView useCashPage(@RequestParam(defaultValue = "1")int pageno,Principal principal,int dMno) {
		return new ModelAndView("payment/usedCash").addObject("uc",paymentService.useCashList(pageno, principal.getName(), dMno)).addObject("dMno",dMno);
	}
	
	
}
