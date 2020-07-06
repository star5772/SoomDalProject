package com.icia.dal.controller.rest;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.service.rest.*;

@RestController
public class QnaRestCotroller {
	@Inject
	private QnaCommentRestService qnaCommentService;
	
	@PostMapping("/comment/write")
	public ResponseEntity<Void> commentWrite(String cContent, Integer qNo) {
		qnaCommentService.write(cContent, qNo);
		return ResponseEntity.ok(null);
	}
	@DeleteMapping("/comment/delete")
	public ResponseEntity<Void> commentDelete(Integer cNo,Integer qNo){
		qnaCommentService.delete(cNo, qNo);
		return ResponseEntity.ok(null);
	}
}
