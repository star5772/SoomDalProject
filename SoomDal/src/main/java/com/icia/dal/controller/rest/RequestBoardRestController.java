package com.icia.dal.controller.rest;

import java.security.*;

import javax.inject.*;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.service.*;
import com.icia.dal.service.rest.*;

@RestController
@RequestMapping("/member")
public class RequestBoardRestController {
	@Inject
	private RequestBoardRestService reqService;
	
	@PostMapping("/reqboard/report")
	public ResponseEntity<Void> reportBoard(int rbNo,Principal principal,String reason) {
		reqService.report(rbNo,principal.getName(),reason);
		return ResponseEntity.ok(null);
	}
}
