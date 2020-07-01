package com.icia.dal.controller;

import java.security.*;

import javax.inject.*;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.dal.Exception.*;
import com.icia.dal.entity.*;
import com.icia.dal.service.*;
@RequestMapping("/member")
@Controller
public class QnaBoardController {
	@Inject
	private QnaBoardService qnaBoardService;
	
	@GetMapping("/qnaBoard/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int pageno,@Nullable String qName) {
		return new ModelAndView("main").addObject("viewName", "qnaBoard/list.jsp").addObject("qnaPage",qnaBoardService.list(pageno,qName));
	}
	
	
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
		int qno = qnaBoardService.write(qnaBoard,username);
		return "redirect:/member/qnaBoard/read?qNo="+qno;
				
	}
	@PostMapping("/qnaBoard/delete")
	public String deleteToQnaBoard(int qNo) {
		qnaBoardService.delete(qNo);
		return "redirect:/member/qnaBoard/list";
	}
}
