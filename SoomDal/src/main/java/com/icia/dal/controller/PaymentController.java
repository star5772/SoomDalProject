package com.icia.dal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dal.entity.RequestPayment;
import com.icia.dal.service.PaymentService;

@Controller
@RequestMapping("/member")
public class PaymentController {

	private PaymentService paymentService;
	
	@GetMapping("/payment/store")
	public ModelAndView store() {
		return new ModelAndView("main").addObject("viewName","payment/store.jsp").addObject("paymentList","payment/store.jpg");
	}
	@PostMapping("/payment/store")
	public String insertCash(RequestPayment rp,RedirectAttributes ra) {
		paymentService.insertCashToDalin(rp);
		ra.addFlashAttribute("msg","캐쉬 충전이 완료되었습니다");
		return "redirect:/system/msg";
	}
}
