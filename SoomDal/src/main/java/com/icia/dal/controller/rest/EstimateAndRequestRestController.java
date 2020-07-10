package com.icia.dal.controller.rest;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dal.service.rest.EstimateRestService;
import com.icia.dal.service.rest.RequestRestService;


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
		
		// 달인 -> 요청서 가리기
		@Secured("ROLE_DALIN")
		@PostMapping("/jeja/request/disableByDalin")
		public ResponseEntity<?> disableByDalinToRequest(int rNo,int dMno) {
			return ResponseEntity.ok(requestService.setDisableByDalinToRequest(rNo,dMno));
		}
		// 제자 -> 보낸 요청서 가리기
		@Secured("ROLE_JEJA")
		@PostMapping("/jeja/request/disableByJeja")
		public ResponseEntity<?> disableByJejaToRequest(int rNo,int jMno) {
			return ResponseEntity.ok(requestService.setDisableByJejaToRequest(rNo,jMno));
		}
		// 달인 -> 견적서 가리기
		@Secured("ROLE_DALIN")
		@PostMapping("/dalin/estimate/disableByDalin")
		public ResponseEntity<?> disableByDalinToEstimate(int eNo,int dMno) {
			return ResponseEntity.ok(estimateService.setDisableByDalinToEstimate(eNo,dMno));
		}
		// 제자 -> 견적서 가리기
		@Secured("ROLE_JEJA")
		@PostMapping("/dalin/estimate/disableByJeja")
		public ResponseEntity<?> disableByJejaToEstimate(int eNo,int jMno) {
			return ResponseEntity.ok(estimateService.setDisableByJejaToEstimate(eNo,jMno));
		}
		// 달인 -> 요청서 거절
		@Secured("ROLE_DALIN")
		@PostMapping("/jeja/request/no")
		public ResponseEntity<?> refuseRequest(int rNo,int jMno,Principal principal) {
			return ResponseEntity.ok(requestService.refuseRequest(rNo,jMno,principal.getName()));		
		}
		// 제자 -> 견적서 거절
		@Secured("ROLE_JEJA")
		@PostMapping("/dalin/estimate/no")
		public ResponseEntity<?> refuseEstimate(int eNo,int dMno,Principal principal) {
			return ResponseEntity.ok(estimateService.refuseEstimate(eNo,dMno,principal.getName()));		
		}	
}
