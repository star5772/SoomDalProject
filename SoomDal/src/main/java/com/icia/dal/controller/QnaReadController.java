package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.Exception.*;
import com.icia.dal.entity.*;
import com.icia.dal.service.*;
@RequestMapping("/member")
@Controller
public class QnaReadController {
	@Inject
	private QnaBoardService qnaBoardService;
	
	@GetMapping("/qnaBoard/read")
	public ModelAndView read(int qNo, Principal principal) throws AccessExeption {
		String username = principal.getName();
		// 글을 찾아와서 그글이 비밀글이면
		if(qnaBoardService.read(qNo).isSecret()==true) {
			if(qnaBoardService.read(qNo).getWriter().equals(principal.getName())==true)
				return new ModelAndView("main").addObject("viewName", "qnaBoard/read.jsp").addObject("read", qnaBoardService.read(qNo));
			else
				throw new AccessExeption();
		}else
			return new ModelAndView("main").addObject("viewName", "qnaBoard/read.jsp").addObject("read", qnaBoardService.read(qNo));
	}
	
	
	@GetMapping("/qnaBoard/write")
	public ModelAndView wirte() {
		return new ModelAndView("main").addObject("viewName","qnaBoard/write.jsp");
	}
	@PostMapping("/qnaBoard/write")
	public String write(QnaBoard qnaBoard ,Principal principal) {
		String username = principal.getName();
		qnaBoardService.write(qnaBoard,username);
		return "redirect:/dal/member/qnaBoard/list";
				
	}
}
