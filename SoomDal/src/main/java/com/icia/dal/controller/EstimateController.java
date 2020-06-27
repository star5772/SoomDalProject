package com.icia.dal.controller;


import java.security.Principal;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.EstimateNotFoundException;
import com.icia.dal.entity.Estimate;
import com.icia.dal.service.EstimateService;

@RequestMapping("/member")
@Controller
public class EstimateController {
	@Inject
	private EstimateService estimateService;
	
	// 보낸 견적서 목록
	@GetMapping("/estimate/list")
	public ModelAndView sendEstimateList(@RequestParam(defaultValue = "1") int pageno,int dMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateList.jsp").addObject("sendEstimate",estimateService.sendEstimateList(pageno,dMno));
	}
	// 견적서 보내기 화면출력
	@GetMapping("/estimate/send")
	public ModelAndView sendEstimate(int jMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateWrite.jsp").addObject("jMno",jMno);
	}
	// 견적서 보내기
	@PostMapping("/estimate/send")
	public ModelAndView sendEstimate(Estimate et,BindingResult br,Principal principal) throws BindException {
		if(br.hasErrors())
			throw new BindException(br);
		estimateService.writeToEstimate(et);
		return new ModelAndView("redirect:/member/estimate/list");
	}
	
	// 보낸 견적서 읽기
	@GetMapping("/estimate/read")
	public ModelAndView readToSendEstimate(@RequestParam@NotNull Integer eNo) throws EstimateNotFoundException {
		return new ModelAndView("main").addObject("viewName","estimate/readEstimate").addObject("readEstimate",estimateService.readToSendEstimateToDalin(eNo));
	}
	
	@PostMapping("/estimate/readToEstimate")
	public ResponseEntity<?> readToEstimateJeja(boolean jIsOk,int eNo,int dMno,int jMno) {
		if(jIsOk==true)
			estimateService.acceptToEstimate(eNo,dMno,jMno);
		return ResponseEntity.ok(null);
	}
}
