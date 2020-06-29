package com.icia.dal.controller.rest;

import java.io.*;
import java.security.*;

import javax.inject.Inject;
import javax.validation.*;

import org.springframework.http.ResponseEntity;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.dto.*;
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
	
	// 달인 프로필 정보 변경
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/dalin/info_update")
	public ResponseEntity<Void> profileUpdate(DalinDto.DtoForUpdateToDalinProfile dto, 
			@RequestParam("sajin") @Nullable MultipartFile sajin, Principal principal) {
		dto.setDName(principal.getName());
		try {
			dalService.profileUpdate(dto, sajin);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(null);
	}
	
	// 달인 내정보 변경
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/dalin/my_info_update")
	public ResponseEntity<Void> update(@Valid DalinDto.DtoForUpdateToDalin dto, BindingResult results
			, Principal principal) throws BindException {
		System.out.println(dto.getDTel());
		if(results.hasErrors())
			throw  new BindException(results);
		System.out.println("2===========");
		dalService.update(dto, principal.getName());
		return ResponseEntity.ok(null);
	}
	
}
