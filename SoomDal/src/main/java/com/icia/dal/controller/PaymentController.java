package com.icia.dal.controller;

import java.security.Principal;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.entity.RequestPayment;
import com.icia.dal.service.PaymentService;

@Controller
@RequestMapping("/member")
public class PaymentController {

	private PaymentService paymentService;
	
	@GetMapping("/payment/store")
	public ModelAndView store() {
		return new ModelAndView("main").addObject("viewName","payment/store.jsp").addObject("paymentList","payment/store.jpg");
	}
	@PostMapping("/payment/store")
	public ResponseEntity<?> RequestPayment(RequestPayment rp,Principal principal) {
		paymentService.insertCashToDalin(rp,principal.getName());
		return ResponseEntity.ok(paymentService.insertCashToDalin(rp,principal.getName())); 
	}
	
	@PostMapping("/payment/contrast")
	public ResponseEntity<?> ContrastPcode(String AuthCode,Principal principal) throws JobFailException {
		String username = principal.getName();
		if(paymentService.reqCashMember(AuthCode)==null) {
			throw new JobFailException();
		}else {
			paymentService.addCashToDalin(AuthCode,username);
		}
		return ResponseEntity.ok(null);
	}
}
