package com.icia.dal.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.MemoNotFoundException;
import com.icia.dal.service.MemoService;

@RequestMapping("/member")
@Controller
public class MemoController {
	
	@Inject
	private MemoService memoService;
	
	@GetMapping("/memo/memo_receiveList")
	public ModelAndView MemoList(Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","memo/memo_list.jsp").addObject("memoList",memoService.findAllByMemo(username));
	}
	
	@GetMapping("/memo/memo_read")
	public ModelAndView MemoRead(int mno) throws MemoNotFoundException {
		return new ModelAndView("main").addObject("viewname","memo/memo_read.jsp").addObject("memoRead", memoService.findById(mno));
	}

}
