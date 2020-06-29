package com.icia.dal.controller.rest;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.Exception.UserNotFoundException;
import com.icia.dal.service.DalinService;
import com.icia.dal.service.JejaService;

@RequestMapping("/member")
@RestController
public class MemberRestController {
	@Inject
	private DalinService dalService;
	@Inject
	private JejaService jejaService;
	
	@PostMapping("/dalin/find_id")
	public ResponseEntity<?> findId(String dName,String dTel) throws UserNotFoundException{
		return ResponseEntity.ok(dalService.findId(dName,dTel));
	}
	
	@PostMapping("/jeja/find_id")
	public ResponseEntity<?> findJejaId(String jName,String jTel) throws UserNotFoundException{
		return ResponseEntity.ok(jejaService.findId(jName,jTel));
	}

}
