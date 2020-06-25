package com.icia.dal.controller.rest;

import java.security.*;

import javax.inject.*;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.dto.*;
import com.icia.dal.service.*;

@RestController
public class JejaRestController {
	@Inject
	private JejaService service;
	
	@GetMapping("/jeja/check_email")
	public ResponseEntity<Void> ableEmail(String jEmail) {
		service.existsByEmail(jEmail);
		return ResponseEntity.ok(null);
	}
	
	@PutMapping("/jeja/info_update")
	public ResponseEntity<Void> updateInfo(JejaDto.DtoForJejaUpdate dto,Principal principal) {
		service.update(dto,principal.getName());
		return ResponseEntity.ok(null);
	}
}
