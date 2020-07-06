package com.icia.dal.controller.rest;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.entity.RequestPayment;
import com.icia.dal.service.rest.*;

@Secured("ROLE_DALIN")
@RequestMapping("/member")
@RestController
public class PaymentRestController {
	@Inject
	private PaymentRestService paymentService;
	

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
	
	@PostMapping("/payment/refundReq")
	public ResponseEntity<?> refundRequest(String pCode,Principal principal) {
		System.out.println(pCode);
		String username = principal.getName();
		return ResponseEntity.ok(paymentService.requestRefund(pCode,username));
	}
}
