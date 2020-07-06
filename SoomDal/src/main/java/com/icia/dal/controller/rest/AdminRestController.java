package com.icia.dal.controller.rest;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.entity.Field;
import com.icia.dal.service.AdminService;
import com.icia.dal.service.rest.*;

@Secured("ROLE_ADMIN")
@RequestMapping("/member")
@RestController
public class AdminRestController {
	@Inject
	private AdminRestService adService;

	// 세부분야 사진 등록
	@PostMapping("/admin/insertField")
	public ResponseEntity<Void> insertFieldSajin(String fNo,String fName,MultipartFile sajin) throws IllegalStateException, IOException {
		System.out.println(sajin);
		Field fl = Field.builder().fName(fName).fNo(fNo).build();
		adService.insertFieldSajin(fl, sajin);
		return ResponseEntity.ok(null);
	}
	
	// 회원블락상태 변경
	@PostMapping("/admin/member_manage")
	public ResponseEntity<Void> memberManage(Boolean jIsBlock,String jEmail) {
		System.out.println(jIsBlock+"----------------------------------");
		
		adService.updateJenabled(jIsBlock, jEmail);
		return ResponseEntity.ok(null);
	}
}
