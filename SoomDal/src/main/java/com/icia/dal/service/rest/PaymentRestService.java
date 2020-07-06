package com.icia.dal.service.rest;

import java.time.*;

import javax.inject.*;

import org.apache.commons.lang3.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class PaymentRestService {
	@Inject
	private DalinDao dalDao;
	@Inject
	private PaymentDao paymentDao;
	
	public int insertCashToDalin(RequestPayment rp,String username) {
		// 랜덤한 코드 8자리 생성후 결제코드로 입력
		String code = RandomStringUtils.randomAlphanumeric(6);
		rp.setPCode(code);
		Dalin dalin = dalDao.findByDalin(username);
		rp.setDMno(dalin.getDMno());
		rp.setFNo(dalin.getFNo());
		rp.setDTel(dalin.getDTel());
		rp.setDEmail(dalin.getDEmail());
		// 충전요청한 금액만큼 보유 캐쉬 변경
		return paymentDao.insertToPayment(rp);
	}
	
	public RequestPayment reqCashMember(String username) {
		return paymentDao.findByPayment(username);
	}
	
	public int addCashToDalin(String pCode,String username) {
		int money = paymentDao.findToCash(pCode);
		paymentDao.addCashToDalin(Dalin.builder().dEmail(username).dCash(money).build());
		// 결제내역 출력을위한 결제내역 입력.
		paymentDao.insertToNowPayment(NowPayment.builder().dEmail(username).pCode(pCode).pDate(LocalDateTime.now()).pMoney(money).build());
		return paymentDao.deleteToPayment(username);
	}
	
}
