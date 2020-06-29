package com.icia.dal.controller.rest;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.entity.Field;
import com.icia.dal.service.AdminService;

@RequestMapping("/member")
@RestController
public class AdminRestController {
	@Inject
	private AdminService adService;
	
	@PostMapping("/admin/insertField")
	public ResponseEntity<Void> insertFieldSajin(String fNo,String fName,MultipartFile sajin) throws IllegalStateException, IOException {
		System.out.println(sajin);
		Field fl = Field.builder().fName(fName).fNo(fNo).build();
		adService.insertFieldSajin(fl, sajin);
		return ResponseEntity.ok(null);
	}
}
