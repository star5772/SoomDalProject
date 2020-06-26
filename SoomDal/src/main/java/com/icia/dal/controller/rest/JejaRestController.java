package com.icia.dal.controller.rest;

import java.security.*;

import javax.inject.*;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dto.*;
import com.icia.dal.service.*;

@RestController
public class JejaRestController {
	@Inject
	private JejaService jejaService;
	@Inject
	private ReviewService reviewService;
	
	@GetMapping("/jeja/check_email")
	public ResponseEntity<Void> ableEmail(String jEmail) {
		jejaService.existsByEmail(jEmail);
		return ResponseEntity.ok(null);
	}
	
	@PutMapping("/jeja/info_update")
	public ResponseEntity<Void> updateInfo(JejaDto.DtoForJejaUpdate dto,Principal principal) {
		jejaService.update(dto,principal.getName());
		return ResponseEntity.ok(null);
	}
	
	@DeleteMapping("/jeja/review_delete")
	public ResponseEntity<?> deleteToReview(int rNo,int dMno, Principal principal) throws JobFailException{
		String writer = principal.getName();
		reviewService.deleteToReview(rNo,dMno,writer);
		return ResponseEntity.ok(null);
	}
}
