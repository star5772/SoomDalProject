package com.icia.dal.controller.rest;

import java.security.Principal;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dto.DalinDto;
import com.icia.dal.service.rest.DalinRestService;

@RestController
public class DalinRestController {
	
	@Inject
	private DalinRestService dalService;
	
	// 달인 이메일 체크
	@PreAuthorize("isAnonymous()")
	@GetMapping("/dalin/check_email")
	public ResponseEntity<Boolean> ableEmail(String dEmail) throws MembernameExistException {
		return ResponseEntity.ok(dalService.checkId(dEmail));
	}

	// 달인 내정보 변경
	@Secured("ROLE_DALIN")
	@PutMapping("/dalin/my_info_update")
	public ResponseEntity<Void> update(@Valid DalinDto.DtoForUpdateToDalin dto, BindingResult results
			, Principal principal) throws BindException {
		System.out.println(dto.getDTel());
		if(results.hasErrors())
			throw  new BindException(results);
		dalService.update(dto, principal.getName());
		return ResponseEntity.ok(null);
	}
	@Secured("ROLE_DALIN")
	@PostMapping("/dalin/report")
	public ResponseEntity<Void> jejaReport(String jEmail, Principal principal, String reason) throws JejaNotFoundException {
		dalService.report(jEmail,principal.getName(),reason);
		return ResponseEntity.ok(null);
	}
}
