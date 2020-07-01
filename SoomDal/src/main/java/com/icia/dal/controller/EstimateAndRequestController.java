package com.icia.dal.controller;


import java.security.Principal;
import java.time.LocalDateTime;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dal.Exception.DalinNotFoundException;
import com.icia.dal.Exception.ReadFailException;
import com.icia.dal.entity.Estimate;
import com.icia.dal.entity.Request;
import com.icia.dal.service.DalinService;
import com.icia.dal.service.EstimateService;
import com.icia.dal.service.RequestService;
import com.icia.dal.util.editor.DatePropertyEditor;

@RequestMapping("/member")
@Controller
public class EstimateAndRequestController {
	@Inject
	private EstimateService estimateService;
	@Inject
	private RequestService requestService;
	@Inject
	private DalinService dalService;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(LocalDateTime.class,"rWantDate", new DatePropertyEditor());
	}
	
	// 받은 견적서 목록
	@GetMapping("/estimate/receiveEstimateList")
	public ModelAndView receiveEstimateList(@RequestParam(defaultValue = "1")int pageno, int jMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateList.jsp").addObject("receiveEstimate",estimateService.receiveEstimateList(pageno,jMno)).addObject("jMno",jMno);
	}
	
	// 보낸 견적서 목록
	@GetMapping("/estimate/sendEstimateList")
	public ModelAndView sendEstimateList(@RequestParam(defaultValue = "1") int pageno,int dMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateList.jsp").addObject("sendEstimate",estimateService.sendEstimateList(pageno,dMno)).addObject("dMno",dMno);
	}
	// 견적서 보내기 화면출력
	@GetMapping("/estimate/sendEstimate")
	public ModelAndView sendEstimate(@RequestParam@NotNull int jMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateWrite.jsp").addObject("jMno",jMno);
	}
	// 견적서 보내기
	@PostMapping("/estimate/sendEstimate")
	public ModelAndView sendEstimate(Estimate et,BindingResult br,Principal principal) throws BindException {
		if(br.hasErrors())
			throw new BindException(br);
		estimateService.writeToEstimate(et);
		return new ModelAndView("redirect:/member/estimate/list");
	}
	
	// 보낸 견적서 읽기
	@GetMapping("/estimate/readToSendEstimate")
	public ModelAndView readToSendEstimate(@RequestParam@NotNull Integer eNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","estimate/readEstimate.jsp").addObject("readEstimate",estimateService.readToSendEstimate(eNo));
	}
	
	// 받은 견적서 읽기
	@GetMapping("/estimate/readToReceiveEstimate")
	public ModelAndView readToReceiveEstimate(@RequestParam@NotNull Integer eNo) throws ReadFailException {
		System.out.println("eNo : "+eNo);
		return new ModelAndView("main").addObject("viewName","estimate/readEstimate.jsp").addObject("readEstimate",estimateService.readToSendEstimate(eNo));
	}
	
	// 제자->견적서 수락
	@PostMapping("/estimate/readToEstimate")
	public ResponseEntity<?> readToEstimateJeja(boolean jIsOk,int eNo,int dMno,int jMno) {
		if(jIsOk==true)
			estimateService.acceptToEstimate(eNo,dMno,jMno);
		return ResponseEntity.ok(null);
	}
	// 달인 -> 받은요청서목록
	@GetMapping("/request/receiveRequest")
	public ModelAndView receiveRequestList(@RequestParam(defaultValue = "1")int pageno,int dMno) {
		return new ModelAndView("main").addObject("viewName","request/requestList.jsp").addObject("receiveRequest",requestService.receiveRequestList(pageno, dMno)).addObject("dMno",dMno);
	}
	
	// 제자 -> 보낸요청서목록 
	@GetMapping("/request/sendRequestList")
	public ModelAndView sendRequestList(@RequestParam(defaultValue = "1")int pageno,int jMno) {
		return new ModelAndView("main").addObject("viewName","request/requestList.jsp").addObject("sendRequest",requestService.sendRequestList(pageno,jMno));
	}
	
	// 달인프로필 -> 제자읽기 -> 요청서 작성화면 출력
	@GetMapping("/request/sendRequest")
	public ModelAndView sendRequest(int dMno) throws DalinNotFoundException {
		return new ModelAndView("main").addObject("viewName","request/sendRequest.jsp").addObject("dMno",dMno);
	}
	
	// 요청서 보내기
	@PostMapping("/request/writeRequest")
	public String sendRequest(Request rq,Principal principal) {
		System.out.println(rq);
		String username = principal.getName();
		requestService.writeToRequest(rq,username);
		return "redirect:/member/request/sendRequestList";
	}
	// 제자 -> 보낸 요청서읽기
	@GetMapping("/request/readToRequestForSend")
	public ModelAndView readToRequestForJeja(@RequestParam@NotNull Integer rNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","request/requestRead.jsp").addObject("readRequest",requestService.readRequest(rNo));
	}
	// 달인 -> 받은 요청서읽기
	@GetMapping("/request/readToRequestForReceive")
	public ModelAndView readToRequestForDalin(@RequestParam@NotNull Integer rNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","request/requestRead.jsp").addObject("readRequest",requestService.readRequest(rNo));
	}
}
