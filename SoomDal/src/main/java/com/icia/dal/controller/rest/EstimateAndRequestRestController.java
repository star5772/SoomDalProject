package com.icia.dal.controller.rest;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.service.rest.*;


@RestController
public class EstimateAndRequestRestController {
	@Inject
	private EstimateRestService estimateService;
	@Inject
	private RequestRestService requestService;
	
	// 제자->견적서 수락
		@Secured("ROLE_JEJA")
		@PostMapping("/dalin/estimate/readToEstimate")
		public ResponseEntity<?> readToEstimateJeja(boolean jIsOk,int eNo,int dMno,int jMno) {
			if(jIsOk==true)
				estimateService.acceptToEstimate(eNo,dMno,jMno);
			return ResponseEntity.ok(null);
		}
		
		@Secured("ROLE_DALIN")
		@PostMapping("/jeja/request/disableByDalin")
		public ResponseEntity<?> disableByDalinToRequest(int rNo,int dMno) {
			return ResponseEntity.ok(requestService.setDisableByDalinToRequest(rNo,dMno));
		}
		
		@Secured("ROLE_JEJA")
		@PostMapping("/jeja/request/disableByJeja")
		public ResponseEntity<?> disableByJejaToRequest(int rNo,int jMno) {
			return ResponseEntity.ok(requestService.setDisableByJejaToRequest(rNo,jMno));
		}
		
		@Secured("ROLE_DALIN")
		@PostMapping("/dalin/estimate/disableByDalin")
		public ResponseEntity<?> disableByDalinToEstimate(int eNo,int dMno) {
			return ResponseEntity.ok(estimateService.setDisableByDalinToEstimate(eNo,dMno));
		}
		
		@Secured("ROLE_JEJA")
		@PostMapping("/dalin/estimate/disableByJeja")
		public ResponseEntity<?> disableByJejaToEstimate(int eNo,int jMno) {
			return ResponseEntity.ok(estimateService.setDisableByJejaToEstimate(eNo,jMno));
		}
		
		
	
}
