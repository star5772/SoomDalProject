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
	public ResponseEntity<Void> insertFieldSajin(Field fl,MultipartFile sajin) throws IllegalStateException, IOException {
		adService.insertFieldSajin(fl, sajin);
		return ResponseEntity.ok(null);
	}
}
