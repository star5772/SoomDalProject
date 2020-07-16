package com.icia.dal.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.service.PaymentService;

@Secured("ROLE_DALIN")
@Controller
@RequestMapping("/dalin")
public class PaymentController {
	@Inject
	private PaymentService paymentService;
	
	// 결제
	@GetMapping("/payment/store")
	public ModelAndView store(@RequestParam(defaultValue="1")int pageno,Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","payment/store.jsp").addObject("cash",paymentService.readToDalinCash(username))
				.addObject("nowPayment",paymentService.reqPaymentToDalin(pageno,username));
	}
	// 환불내역
	@GetMapping("/payment/refund")
	public ModelAndView refundPage(@RequestParam(defaultValue = "1")int pageno,Principal principal) {
		return new ModelAndView("payment/refundPage").addObject("refund").addObject("nowRefund",paymentService.nowRefund(pageno,principal.getName()));
	}
	
	
	
}
