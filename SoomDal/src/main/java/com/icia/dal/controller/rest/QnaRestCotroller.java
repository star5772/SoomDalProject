package com.icia.dal.controller.rest;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.service.QnaCommentService;

@RestController
public class QnaRestCotroller {
	@Inject
	private QnaCommentService qnaCommentService;
	
	@PostMapping("/comment/write")
	public ResponseEntity<Void> commentWrite(String cContent, int qNo) {
		qnaCommentService.write(cContent, qNo);
		return ResponseEntity.ok(null);
	}
	@DeleteMapping("/comment/delete")
	public ResponseEntity<Void> commentDelete(int cNo,int qNo){
		qnaCommentService.delete(cNo, qNo);
		return ResponseEntity.ok(null);
	}
}
