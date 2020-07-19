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
@RequestMapping("/dalin")
@RestController
public class PaymentRestController {
	@Inject
	private PaymentRestService paymentService;
	
	// 결제하기
	@PostMapping("/payment/store")
	public ResponseEntity<?> RequestPayment(RequestPayment rp,Principal principal) {
		// 결제 신청한 정보등을 입력받아 서비스로 전송
		paymentService.insertCashToDalin(rp,principal.getName());
		return ResponseEntity.ok(paymentService.insertCashToDalin(rp,principal.getName())); 
	}
	
	
	// 인증번호
	@PostMapping("/payment/contrast")
	public ResponseEntity<?> ContrastPcode(String AuthCode,Principal principal) throws JobFailException {
		String username = principal.getName();
		if(paymentService.reqCashMember(username)==null) {
			throw new JobFailException("해당하는 정보가 없습니다");
		}else {
			paymentService.addCashToDalin(AuthCode,username);
		}
		return ResponseEntity.ok(null);
	}
	// 환불요청
	@PostMapping("/payment/refundReq")
	public ResponseEntity<?> refundRequest(String pCode,Principal principal) {
		System.out.println(pCode);
		String username = principal.getName();
		return ResponseEntity.ok(paymentService.requestRefund(pCode,username));
	}
}
