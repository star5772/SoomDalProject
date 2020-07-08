package com.icia.dal.controller.rest;

import java.security.*;

import javax.inject.*;

import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.service.rest.*;
import com.sun.mail.iap.Response;

@RestController
@RequestMapping("/member")
public class RequestBoardRestController {
	@Inject
	private RequestBoardRestService reqService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/reqboard/report")
	public ResponseEntity<Void> reportBoard(int rbNo,Principal principal,String reason) {
		reqService.report(rbNo,principal.getName(),reason);
		return ResponseEntity.ok(null);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/reqboard/delete")
	public ResponseEntity<Void> deletereqBoard(int rbNo,Principal principal) {
		String username = principal.getName();
		reqService.deleteToReqBoard(rbNo,username);
		return ResponseEntity.ok(null);
	}
}
