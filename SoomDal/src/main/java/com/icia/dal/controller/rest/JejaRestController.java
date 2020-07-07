package com.icia.dal.controller.rest;

import java.security.*;
import java.util.List;

import javax.inject.*;

import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dto.*;
import com.icia.dal.entity.Review;
import com.icia.dal.service.rest.*;


@RestController
public class JejaRestController {
	@Inject
	private JejaRestService jejaService;
	@Inject
	private ReviewRestService reviewService;
	
	// 제자 이메일 체크
	@PreAuthorize("isAnonymous()")
	@GetMapping("/jeja/check_email")
	public ResponseEntity<Void> ableEmail(String jEmail) {
		jejaService.existsByEmail(jEmail);
		return ResponseEntity.ok(null);
	}
	
	// 내정보 수정
	@Secured("ROLE_JEJA")
	@PutMapping("/jeja/info_update")
	public ResponseEntity<Void> updateInfo(JejaDto.DtoForJejaUpdate dto,Principal principal) {
		jejaService.update(dto,principal.getName());
		return ResponseEntity.ok(null);
	}
	
	// 리뷰 삭제
	@Secured("ROLE_JEJA")
	@DeleteMapping("/jeja/review_delete")
	public ResponseEntity<?> deleteToReview(int rNo,int dMno, Principal principal) throws JobFailException{
		String writer = principal.getName();
		reviewService.deleteToReview(rNo,dMno,writer);
		return ResponseEntity.ok(null);
	}
	
	// 제자 리뷰작성
	@Secured("ROLE_JEJA")
	@PostMapping("/member/reviewWrite")
	public ResponseEntity<List<Review>> reviewWrite(Review rv,Principal principal) {
		System.out.println(rv);
		String username = principal.getName();
		return ResponseEntity.ok(reviewService.reviewAuthChkAndWrite(rv, username,rv.getDMno()));
	}
}
