package com.icia.dal.service;

import javax.inject.*;

import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class JejaService {
	@Inject
	private JejaDao dao;
	@Inject
	private PasswordEncoder pwdEncoder;

	public void existsByEmail(String jEmail) {
		String email = dao.existsByjEmail(jEmail);
		// 나중에 예외처리 다시 해야함
		if(email!=null)
			throw new RuntimeException();
	}

	public void join(Jeja jeja) {
		String pwd = jeja.getJPassword();
		String encodedPwd = pwdEncoder.encode(pwd);
		jeja.setJPassword(encodedPwd);
		// 나중에 회원가입 실패했을 시 예외처리 다시 해야함
		if(dao.insertJeja(jeja)==0)
			throw new RuntimeException();
	}
	
}
