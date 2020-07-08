package com.icia.dal.service.rest;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.icia.dal.dao.RequestDao;

@Service
public class RequestRestService {
	@Inject
	private RequestDao requestDao;
	
	public int setDisableByDalinToRequest(int rNo,int dMno) {
		return requestDao.setDisableByDalin(rNo,dMno);
	}
	
	public int setDisableByJejaToRequest(int rNo,int jMno) {
		return requestDao.setDisableByJeja(rNo,jMno);
	}
}
