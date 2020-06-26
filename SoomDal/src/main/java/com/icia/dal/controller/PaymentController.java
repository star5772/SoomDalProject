package com.icia.dal.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.entity.RequestPayment;
import com.icia.dal.service.PaymentService;

@Controller
@RequestMapping("/member")
public class PaymentController {
	@Inject
	private PaymentService paymentService;
	
	@GetMapping("/payment/store")
	public ModelAndView store(@RequestParam(defaultValue="1")int pageno,Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","payment/store.jsp").addObject("cash",paymentService.readToDalinCash(username))
				.addObject("nowPayment",paymentService.reqPaymentToDalin(pageno,username));
	}
	@PostMapping("/payment/store")
	public ResponseEntity<?> RequestPayment(RequestPayment rp,Principal principal) {
		paymentService.insertCashToDalin(rp,principal.getName());
		return ResponseEntity.ok(paymentService.insertCashToDalin(rp,principal.getName())); 
	}
	
	@PostMapping("/payment/contrast")
	public ResponseEntity<?> ContrastPcode(String AuthCode,Principal principal) throws JobFailException {
		String username = principal.getName();
		if(paymentService.reqCashMember(username)==null) {
			throw new JobFailException();
		}else {
			paymentService.addCashToDalin(AuthCode,username);
		}
		return ResponseEntity.ok(null);
	}
}
