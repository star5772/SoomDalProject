package com.icia.dal.controller;

import java.security.Principal;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icia.dal.entity.RequestPayment;
import com.icia.dal.service.PaymentService;
import com.icia.dal.util.Coolsms;

@RequestMapping("/member")
@Controller
public class SendSMSController {

	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/sendSMS")
	public ResponseEntity<Void> sendSMS(String dTel,Principal principal) {
		
		RequestPayment reqPayment = paymentService.reqCashMember(principal.getName());
		
		String api_key = "NCSYXHQI2AZZ1SYV";
		String api_secret = "RM4ORTFUGYWR54QG9LURJVJFOX55R6TB";
		Coolsms coolsms = new Coolsms(api_key, api_secret); // 메시지보내기 객체 생성
		String key = reqPayment.getPCode(); // 인증키 생성
		System.out.println(key);
		
		/*
		 * Parameters 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
		 */
		
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", dTel); // 수신번호
		set.put("from", "01043887868" ); // 발신번호
		set.put("text", "숨달입니다. 인증번호는 [" + key + "] 입니다."); // 문자내용
		set.put("type", "sms"); // 문자 타입

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		if ((boolean)result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공 : " + result.get("status"));
			System.out.println(result.get("status")); // 성공여부
			//return "success";
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
			//return "fail";
		}
		return ResponseEntity.ok(null);
	}
}
