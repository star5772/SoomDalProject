package com.icia.dal.service;

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

	public int insertCashToDalin(RequestPayment rp) {
		// 랜덤한 코드 8자리 생성후 결제코드로 입력
		String code = RandomStringUtils.randomAlphanumeric(8);
		rp.setPCode(code);
		Dalin dalin = dalDao.findByDalin(rp.getDMno());
		// 충전요청한 금액만큼 보유 캐쉬 변경
		dalDao.updateToDalin(dalin.setDCash(rp.getPMoney()));
		return paymentDao.insertToPayment(rp);
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
