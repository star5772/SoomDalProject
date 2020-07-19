package com.icia.dal.service.rest;

import java.time.*;

import javax.inject.*;

import org.apache.commons.lang3.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class PaymentRestService {
	@Inject
	private DalinDao dalDao;
	@Inject
	private PaymentDao paymentDao;
	
	@Transactional
	public int insertCashToDalin(RequestPayment rp,String username) {
		// 랜덤한 코드 8자리 생성후 결제코드로 입력
		String code = RandomStringUtils.randomAlphanumeric(6);
		rp.setPCode(code);
		// 로그인한 아이디로 달인 정보를 찾음
		Dalin dalin = dalDao.findByDalin(username);
		// 찾은 달인정보의 달인번호,분야,연락처,아이디를 결제신청 테이블에 저장
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
	@Transactional
	public int addCashToDalin(String pCode,String username) {
		int money = paymentDao.findToCash(pCode);
		paymentDao.addCashToDalin(Dalin.builder().dEmail(username).dCash(money).build());
		// 결제내역 출력을위한 결제내역 입력.
		paymentDao.insertToNowPayment(NowPayment.builder().dEmail(username).pCode(pCode).pDate(LocalDateTime.now()).pMoney(money).build());
		return paymentDao.deleteToPayment(username);
	}
	@Transactional
	public boolean requestRefund(String pCode,String username) {
		Dalin dal = dalDao.findByDalin(username);
		int cash = paymentDao.findByDalinCash(username);
		int requestRefundCash = paymentDao.findByPmoneyToPcode(pCode);
		if(cash<requestRefundCash) {
			return false;
		}else {
			NowPayment np = NowPayment.builder().pCode(pCode).pRefundIsOk(true).pRequestRefund(true).build();
			paymentDao.updatePaymentToDalin(np);
			dalDao.minusCash(requestRefundCash, dal.getDMno());
			String recode = RandomStringUtils.randomAlphanumeric(8);
			NowRefund nr = NowRefund.builder().dEmail(username).pCode(pCode).pMoney(requestRefundCash).pRefundCode(recode).build();
			paymentDao.insertToNowRefund(nr);
			return true;
		}
	}
	
}
