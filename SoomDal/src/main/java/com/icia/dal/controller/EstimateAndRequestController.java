package com.icia.dal.controller;


import java.security.Principal;
import java.time.LocalDateTime;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.springframework.security.access.annotation.*;
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

import com.google.inject.internal.Nullable;
import com.icia.dal.Exception.*;
import com.icia.dal.entity.Estimate;
import com.icia.dal.entity.Request;
import com.icia.dal.service.DalinService;
import com.icia.dal.service.EstimateService;
import com.icia.dal.service.JejaService;
import com.icia.dal.service.RequestService;
import com.icia.dal.util.editor.DatePropertyEditor;


@Controller
public class EstimateAndRequestController {
	@Inject
	private EstimateService estimateService;
	@Inject
	private RequestService requestService;
	@Inject
	private DalinService dalService;
	@Inject
	private JejaService jejaService;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(LocalDateTime.class,"rWantDate", new DatePropertyEditor());
	}
	
	// 받은 견적서 목록
	@Secured("ROLE_JEJA")
	@GetMapping("/dalin/estimate/receiveEstimateList")
	public ModelAndView receiveEstimateList(@RequestParam(defaultValue = "1")int pageno, int jMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateListToJeja.jsp").addObject("receiveEstimate",estimateService.receiveEstimateList(pageno,jMno)).addObject("jMno",jMno);
	}
	
	// 보낸 견적서 목록
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/estimate/sendEstimateList")
	public ModelAndView sendEstimateList(@RequestParam(defaultValue = "1") int pageno,int dMno) {
		return new ModelAndView("main").addObject("viewName","estimate/estimateListToDalin.jsp").addObject("sendEstimate",estimateService.sendEstimateList(pageno,dMno)).addObject("dMno",dMno);
	}
	
	// 견적서 보내기 화면출력
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/estimate/sendEstimate")
	public ModelAndView sendEstimate(@RequestParam@NotNull int rNo,Principal principal) {
		String dEmail = principal.getName();
		return new ModelAndView("main").addObject("viewName","estimate/estimateWrite.jsp").addObject("rNo",rNo).addObject("dProfile",estimateService.readToDalinProfile(dEmail));
	}
	
	// 견적서 보내기
	@Secured("ROLE_DALIN")
	@PostMapping("/dalin/estimate/sendEstimate")
	public ModelAndView sendEstimate(Estimate et,BindingResult br,Principal principal) throws BindException, UserNotFoundException {
		if(br.hasErrors())
			throw new BindException(br);
		String username = principal.getName();
		estimateService.writeToEstimate(et,username); 
		int no = dalService.readToMyInfo(username).getDMno();
		return new ModelAndView("redirect:/dalin/estimate/sendEstimateList?dMno="+no);
	}
	
	// 보낸 견적서 읽기
	@Secured("ROLE_DALIN")
	@GetMapping("/dalin/estimate/readToSendEstimate")
	public ModelAndView readToSendEstimate(@RequestParam@NotNull Integer eNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","estimate/readEstimate.jsp").addObject("readEstimate",estimateService.readToSendEstimate(eNo));
	}
	
	// 받은 견적서 읽기
	@Secured("ROLE_JEJA")
	@GetMapping("/dalin/estimate/readToReceiveEstimate")
	public ModelAndView readToReceiveEstimate(@RequestParam@NotNull Integer eNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","estimate/readEstimate.jsp").addObject("readEstimate",estimateService.readToSendEstimate(eNo));
	}
	
	
	
	
	// 달인 -> 받은요청서목록
	@Secured("ROLE_DALIN")
	@GetMapping("/jeja/request/receiveRequest")
	public ModelAndView receiveRequestList(@RequestParam(defaultValue = "1")int pageno,@Nullable int dMno) {
		return new ModelAndView("main").addObject("viewName","request/requestList.jsp").addObject("receiveRequest",requestService.receiveRequestList(pageno, dMno)).addObject("dMno",dMno);
	}
	
	// 제자 -> 보낸요청서목록 
	@Secured("ROLE_JEJA")
	@GetMapping("/jeja/request/sendRequestList")
	public ModelAndView sendRequestList(@RequestParam(defaultValue = "1")int pageno,@Nullable int jMno) {
		return new ModelAndView("main").addObject("viewName","request/requestList.jsp").addObject("sendRequest",requestService.sendRequestList(pageno,jMno)).addObject("jMno",jMno);
	}
	
	// 달인프로필 -> 제자읽기 -> 요청서 작성화면 출력
	@Secured("ROLE_JEJA")
	@GetMapping("/jeja/request/sendRequest")
	public ModelAndView sendRequest(int dMno) throws DalinNotFoundException {
		return new ModelAndView("main").addObject("viewName","request/sendRequest.jsp").addObject("dMno",dMno);
	}
	
	// 요청서 보내기
	@Secured("ROLE_JEJA")
	@PostMapping("/jeja/request/writeRequest")
	public String sendRequest(Request rq,Principal principal) throws DalinNotFoundException, JejaNotFoundException {
		System.out.println(rq);
		String username = principal.getName();
		int no = jejaService.findById(username).getJMno();
		requestService.writeToRequest(rq,username);
		return "redirect:/jeja/request/sendRequestList?jMno="+ no;
	}
	// 제자 -> 보낸 요청서읽기
	@Secured("ROLE_JEJA")
	@GetMapping("/jeja/request/readToRequestForSend")
	public ModelAndView readToRequestForJeja(@RequestParam@NotNull Integer rNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","request/requestRead.jsp").addObject("readRequest",requestService.readRequest(rNo));
	}
	// 달인 -> 받은 요청서읽기
	@Secured("ROLE_DALIN")
	@GetMapping("/jeja/request/readToRequestForReceive")
	public ModelAndView readToRequestForDalin(@RequestParam@NotNull Integer rNo) throws ReadFailException {
		return new ModelAndView("main").addObject("viewName","request/requestRead.jsp").addObject("readRequest",requestService.readRequest(rNo));
	}
}
