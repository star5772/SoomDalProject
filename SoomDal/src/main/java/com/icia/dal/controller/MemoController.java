package com.icia.dal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/member")
@Controller
public class MemoController {

	@GetMapping("/memo/memo_list")
	public ModelAndView MemoList() {
		return new ModelAndView("main").addObject("viewName","memo/memo_list.jsp");
	}
}
