package com.icia.dal.controller;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.dto.DalinDto;
import com.icia.dal.service.DalinService;

@Controller
public class DalinController {
	@Inject
	private DalinService dalService;
	
	// 달인 회원가입 화면 출력
	@GetMapping("/dalin/join")
	public ModelAndView dalinJoin() {
		return new ModelAndView("main").addObject("viewName","dalin/dalinJoin.jsp");
	}
	
	// 달인 회원가입 처리
	@PostMapping("/dalin/join")
	public String dalinJoin(DalinDto.DtoForJoinToDalin dto,BindingResult br,RedirectAttributes ra) {
		dalService.join(dto);
		ra.addFlashAttribute("msg", "가입을 축하합니다" + dto.getDName() + "님");
		return "redirect:/system/msg";
	}
	
	@GetMapping("/dalin/check_id")
	public ResponseEntity<?> existsById(@RequestParam String dEmail) throws MembernameExistException {
		return ResponseEntity.ok(dalService.checkId(dEmail));
	}
	
	@GetMapping("/system/msg")
	public ModelAndView system() {
		return new ModelAndView("main").addObject("viewName","system/msg.jsp");
	}
}
