package com.icia.dal.service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.RandomStringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.PaymentDao;
import com.icia.dal.dto.PageToRequestPayment;
import com.icia.dal.dto.RequestPaymentDto;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.RequestPayment;
import com.icia.dal.util.PagingUtil;

@Service
public class PaymentService {
	@Inject
	private PaymentDao paymentDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private ModelMapper modelMapper;

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
	
	public int readToDalinCash(String dEmail) {
		return paymentDao.findByDalinCash(dEmail);
	}
	
	public int addCashToDalin(String pCode,String username) {
		System.out.println("서비스 pCode" + pCode);
		System.out.println("서비스 username" + username);
		int money = paymentDao.findToCash(pCode);
		paymentDao.addCashToDalin(Dalin.builder().dEmail(username).dCash(money).build());
		return paymentDao.deleteToPayment(username);
	}
	
	// 캐쉬충전내역 페이징
	public PageToRequestPayment reqPayment(int pageno) {
		int countOfBoard = paymentDao.paymentCount();
		PageToRequestPayment page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<RequestPayment> rpList = null;
		rpList = paymentDao.findAllByPayment(srn, ern);
		
		List<RequestPaymentDto.DtoForListToReuqestPayment> list = new ArrayList<>();
		for(RequestPayment rp:rpList) {
			RequestPaymentDto.DtoForListToReuqestPayment dto = modelMapper.map(rp, RequestPaymentDto.DtoForListToReuqestPayment.class);
			String money = dto.getPMoneyStr() + "원";
			dto.setPMoneyStr(money);
		}
		page.setList(list);
		return page;
	}
	
}
