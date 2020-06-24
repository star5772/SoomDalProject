package com.icia.dal.service;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class JejaService {
	@Inject
	private JejaDao dao;

	public void existsByEmail(String jEmail) {
		String email = dao.existsByjEmail(jEmail);
		// 나중에 예외처리 다시 해야함
		if(email!=null)
			throw new RuntimeException();
	}

	public void join(Jeja jeja) {
		if(dao.insertJeja(jeja)==0)
			throw new RuntimeException();
	}
	
}
