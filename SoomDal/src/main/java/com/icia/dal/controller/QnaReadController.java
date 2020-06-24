package com.icia.dal.controller;

import javax.inject.*;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.entity.*;
import com.icia.dal.service.*;

public class QnaReadController {
	@Inject
	private QnaBoardService qnaBoardService;
	
	@GetMapping("/qnaBoard/read")
	public ModelAndView read() {
		return new ModelAndView("main").addObject("viewName", "qnaBoard/read.jsp");
	}
	@GetMapping("/qnaBoard/write")
	public ModelAndView wirte() {
		return new ModelAndView("main").addObject("viewName","qnaBoard/write.jsp");
	}
	@PostMapping("/qnaBoard/write")
	public String write(QnaBoard qnaBoard) {
		qnaBoardService.write(qnaBoard);
		return "redirect:/dal/qnaBoard/list";
				
	}
}
