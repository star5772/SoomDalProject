package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.Exception.*;
import com.icia.dal.entity.*;
import com.icia.dal.service.*;
@Controller
public class QnaBoardController {
	@Inject
	private QnaBoardService qnaBoardService;
	
	@GetMapping("/dalin/qnaBoard/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int pageno,@Nullable String qName) {
		return new ModelAndView("main").addObject("viewName", "qnaBoard/list.jsp").addObject("qnaPage",qnaBoardService.list(pageno,qName));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/dalin/qnaBoard/read")
	public ModelAndView read(int qNo, Principal principal) throws AccessExeption {
		// 글을 찾아와서 그글이 비밀글이면
		if(qnaBoardService.read(qNo).isSecret()==true) {
			if(qnaBoardService.read(qNo).getWriter().equals(principal.getName())==true)
				return new ModelAndView("main").addObject("viewName", "qnaBoard/read.jsp").addObject("read", qnaBoardService.read(qNo));
			else
				throw new AccessExeption();
		}else {
			return new ModelAndView("main").addObject("viewName", "qnaBoard/read.jsp").addObject("read", qnaBoardService.read(qNo));
		}
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/dalin/qnaBoard/write")
	public ModelAndView wirte() {
		return new ModelAndView("main").addObject("viewName","qnaBoard/write.jsp");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/dalin/qnaBoard/write")
	public String write(QnaBoard qnaBoard ,Principal principal) {
		String username = principal.getName();
		int qno = qnaBoardService.write(qnaBoard,username);
		return "redirect:/member/qnaBoard/read?qNo="+qno;
				
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/dalin/qnaBoard/delete")
	public String deleteToQnaBoard(int qNo) {
		qnaBoardService.delete(qNo);
		return "redirect:/member/qnaBoard/list";
	}
}
