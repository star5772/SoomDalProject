package com.icia.dal.controller.advice;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.dal.Exception.*;

@ControllerAdvice(basePackages= {"com.icia.dal.controller", "com.icia.dal.service"})
public class DalControllerAdvice {
	@ExceptionHandler(UserNotFoundException.class)
	public String UserNotFoundExceptionHandler(RedirectAttributes ra) {
		ra.addFlashAttribute("msg","사용자를 찾을 수 없습니다");
		return "redirect:/system/msg";
	}
	
	@ExceptionHandler(JobFailException.class)
	public String JobFailExceptionHandler(JobFailException e, RedirectAttributes ra) {
		ra.addFlashAttribute("msg",e.getMessage());
		return "redirect:/system/msg";
	}
}
