package com.icia.dal.service.rest;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.RequestDao;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.util.websocket.MessageWebSocketHandler;

@Service
public class RequestRestService {
	@Inject
	private RequestDao requestDao;
	@Inject
	private MessageWebSocketHandler handler;
	@Inject
	private JejaDao jejaDao;
	@Inject
	private DalinDao dalDao;
	
	public int setDisableByDalinToRequest(int rNo,int dMno) {
		return requestDao.setDisableByDalin(rNo,dMno);
	}
	
	public int setDisableByJejaToRequest(int rNo,int jMno) {
		return requestDao.setDisableByJeja(rNo,jMno);
	}

	public int refuseRequest(int rNo, int jMno,String username) {
		Jeja jeja = jejaDao.findByJejaToJMno(jMno);
		Dalin dal = dalDao.findByDalin(username);
		handler.sendJejaMessage(dal.getDName(),jeja.getJName(), "요청서가 거절되었습니다");
		return requestDao.setDisableByDalin(rNo, dal.getDMno());
	}
}
