package com.icia.dal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.service.PaymentService;

@Controller
public class PaymentController {

	private PaymentService paymentService;
	
	@GetMapping("/payment/store")
	public ModelAndView store() {
		return new ModelAndView("main").addObject("viewName","payment/store.jsp");
	}
	
	//public String insertCash()
}
