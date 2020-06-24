package com.icia.dal.controller.rest;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.service.DalinService;

@RestController
public class DalinRestController {
	
	@Inject
	private DalinService dalService;
	
	@GetMapping("/dalin/check_email")
	public ResponseEntity<Void> ableEmail(String dEmail) throws MembernameExistException {
		dalService.checkId(dEmail);
		return ResponseEntity.ok(null);
	}
}
