package com.icia.dal.controller.rest;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.service.EstimateService;
import com.icia.dal.service.rest.*;

@RestController
@RequestMapping("/member")
public class EstimateAndRequestController {
	@Inject
	private EstimateRestService estimateService;
	
	// 제자->견적서 수락
		@PostMapping("/estimate/readToEstimate")
		public ResponseEntity<?> readToEstimateJeja(boolean jIsOk,int eNo,int dMno,int jMno) {
			if(jIsOk==true)
				estimateService.acceptToEstimate(eNo,dMno,jMno);
			return ResponseEntity.ok(null);
		}
	
}
