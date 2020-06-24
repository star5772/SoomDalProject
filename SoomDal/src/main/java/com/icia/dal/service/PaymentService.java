package com.icia.dal.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.PaymentDao;
import com.icia.dal.entity.RequestPayment;

@Service
public class PaymentService {
	@Inject
	private PaymentDao paymentDao;
	@Inject
	private DalinDao dalDao;
	
	
	/*
	 * public int insertCashToDalin(RequestPayment rp) {
	 * 
	 * }
	 */
}
