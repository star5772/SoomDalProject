package com.icia.dal.controller.advice;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.dal.Exception.*;

@RestControllerAdvice(basePackages= {"com.icia.dal.controller.rest", "com.icia.dal.service.rest"})
public class DalRestControllerAdvice {

	@ExceptionHandler(AccessExeption.class)
	public ResponseEntity<String> AccessExeptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("접근권한이 없습니다");
	}
	
	@ExceptionHandler(DalinNotFoundException.class)
	public ResponseEntity<String> DalinNotFoundExceptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("달인을 찾을 수 없습니다");
	}
	
	@ExceptionHandler(JejaNotFoundException.class)
	public ResponseEntity<String> JejaNotFoundExceptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("제자를 찾을 수 없습니다");
	}
	
	@ExceptionHandler(EstimateNotFoundException.class)
	public ResponseEntity<String> EstimateExceptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("존재하는 견적서가 없습니다");
	}
	
	@ExceptionHandler(JobFailException.class)
	public ResponseEntity<String> JobFailExceptionHandler(JobFailException e) {
		return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
	}
	
	@ExceptionHandler(MemoNotFoundException.class)
	public ResponseEntity<String> MemoNotFoundExceptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("존재하는 쪽지가 없습니다");
	}
	
	@ExceptionHandler(UserNotFoundException.class)
	public ResponseEntity<String> UserNotFoundExceptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("사용자를 찾을 수 없습니다");
	}
	
	@ExceptionHandler(ReadFailException.class)
	public ResponseEntity<String> ReadFailExceptionHandler() {
		return ResponseEntity.status(HttpStatus.CONFLICT).body("견적서를 읽어오는데 실패했습니다");
	}
}
