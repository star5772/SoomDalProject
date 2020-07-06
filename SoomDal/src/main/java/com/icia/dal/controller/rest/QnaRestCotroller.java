package com.icia.dal.controller.rest;


import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.service.rest.*;

@RestController
public class QnaRestCotroller {
	@Inject
	private QnaCommentRestService qnaCommentService;
	
	@Secured("ROLE_DALIN")
	@PostMapping("/comment/write")
	public ResponseEntity<Void> commentWrite(String cContent, Integer qNo) {
		qnaCommentService.write(cContent, qNo);
		return ResponseEntity.ok(null);
	}
	@Secured("ROLE_DALIN")
	@DeleteMapping("/comment/delete")
	public ResponseEntity<Void> commentDelete(Integer cNo,Integer qNo){
		qnaCommentService.delete(cNo, qNo);
		return ResponseEntity.ok(null);
	}
}
