package com.icia.dal.controller.rest;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.Exception.UserNotFoundException;
import com.icia.dal.entity.RequestPayment;
import com.icia.dal.entity.Review;
import com.icia.dal.service.DalinService;
import com.icia.dal.service.JejaService;
import com.icia.dal.service.PaymentService;
import com.icia.dal.service.ReviewService;

@RequestMapping("/member")
@RestController
public class PaymentRestController {
	@Inject
	private DalinService dalService;
	@Inject
	private JejaService jejaService;
	@Inject
	private ReviewService reviewService;
	@Inject
	private PaymentService paymentService;
	
	@PostMapping("/dalin/find_id")
	public ResponseEntity<?> findId(String dName,String dTel) throws UserNotFoundException{
		return ResponseEntity.ok(dalService.findId(dName,dTel));
	}
	
	@PostMapping("/jeja/find_id")
	public ResponseEntity<?> findJejaId(String jName,String jTel) throws UserNotFoundException{
		return ResponseEntity.ok(jejaService.findId(jName,jTel));
	}
	
	// 제자 리뷰작성
	@PostMapping("/member/reviewWrite")
	public ResponseEntity<List<Review>> reviewWrite(Review rv,Principal principal) {
		String username = principal.getName();
		return ResponseEntity.ok(reviewService.reviewAuthChkAndWrite(rv, username,rv.getDMno()));
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
