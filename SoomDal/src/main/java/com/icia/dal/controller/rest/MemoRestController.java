package com.icia.dal.controller.rest;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.icia.dal.service.rest.MemoRestService;

@RestController
@RequestMapping("/member")
public class MemoRestController {
	@Inject
	private MemoRestService memoRestService;

	
	// 받는 사람측에서 메모 삭제
	@PostMapping("/memo/disable_by_receiver")
	public ResponseEntity<String> memoDelete(@RequestParam @NotNull int mno, Principal principal) throws JsonParseException, JsonMappingException, IOException{
		memoRestService.disableByReceiver(mno);
		return ResponseEntity.ok("/dal/member/memo/memo_receiveList");
	}
	
	
}
