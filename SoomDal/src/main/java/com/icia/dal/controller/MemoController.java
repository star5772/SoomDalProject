package com.icia.dal.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.MemoNotFoundException;
import com.icia.dal.service.MemoService;
@PreAuthorize("isAuthenticated()")
@RequestMapping("/member")
@Controller
public class MemoController {
	
	@Inject
	private MemoService memoService;
	
	// 받은메모 리스트
	@GetMapping("/memo/memo_receiveList")
	public ModelAndView MemoList(@RequestParam(defaultValue = "1")int pageno, Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","memo/memo_list.jsp").addObject("memoList",memoService.listToMemo(pageno, username));
	}
	
	// 메모 읽기
	@GetMapping("/memo/memo_read")
	public ModelAndView MemoRead(int mno) throws MemoNotFoundException {
		return new ModelAndView("main").addObject("viewName","memo/memo_read.jsp").addObject("memoRead", memoService.findById(mno));
	}

}
