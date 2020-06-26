package com.icia.dal.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dal.dto.DalinDto;
import com.icia.dal.service.DalinService;

@Controller
public class DalinController {
	
	@Inject
	private DalinService dalService;
	
	@GetMapping("/dalin/my_info")
	public ModelAndView myInFo() {
		// 달인 마이페이지
		return new ModelAndView("main").addObject("viewName","dalin/my_info.jsp");
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
		dalService.join(dto);
		ra.addFlashAttribute("msg","회원가입을 축하합니다");
		return "redirect:/member/system/msg";
	}
	
	@GetMapping("/dalin/resign")
	public ModelAndView dalinResign() {
		// 달인 탈퇴
		return new ModelAndView("main").addObject("viewName","dalin/resign.jsp");
	}
	
	@GetMapping("/dalin/info_update")
	public ModelAndView dalinInFoUpdate() {
		// 달인 프로필 수정
		return new ModelAndView("main").addObject("viewName","dalin/info_update.jsp");
	}
	
	@GetMapping("/dalin/my_info_update")
	public ModelAndView dalinMyInFoUpdate() {
		// 달인 내정보 수정
		return new ModelAndView("main").addObject("viewName","dalin/my_info_update.jsp");
	}
	
	@GetMapping("/dalin/estimate_write")
	public ModelAndView dalinEstimateWrite() {
		// 달인 견적서 작성
		return new ModelAndView("main").addObject("viewName","dalin/estimate_write.jsp");
	}
	
	@GetMapping("/dalin/estimate_list")
	public ModelAndView dalinEstimateList() {
		// 달인 쪽지관리(견적서)
		return new ModelAndView("main").addObject("viewName","dalin/estimate_list.jsp");
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
	
}
