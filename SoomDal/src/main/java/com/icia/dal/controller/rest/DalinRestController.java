package com.icia.dal.controller.rest;

import java.security.*;

import javax.inject.Inject;
import javax.validation.*;

import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.dto.*;
import com.icia.dal.service.rest.*;

@Secured("ROLE_DALIN")
@RestController
public class DalinRestController {
	
	@Inject
	private DalinRestService dalService;
	
	// 달인 이메일 체크
	@GetMapping("/dalin/check_email")
	public ResponseEntity<Void> ableEmail(String dEmail) throws MembernameExistException {
		dalService.checkId(dEmail);
		return ResponseEntity.ok(null);
	}
	/*
	// 달인 프로필 정보 변경
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/dalin/info_update")
	public ResponseEntity<Void> profileUpdate(DalinDto.DtoForProfileUpdateToDalin dto, @RequestParam("sajin") @Nullable MultipartFile sajin, Principal principal) {
		try {
			dalService.profileUpdate(dto, sajin);
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(null);
	}
	*/
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
