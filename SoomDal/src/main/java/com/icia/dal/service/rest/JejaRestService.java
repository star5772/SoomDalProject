package com.icia.dal.service.rest;

import javax.inject.*;

import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.dto.JejaDto.*;
import com.icia.dal.entity.*;

@Service
public class JejaRestService {
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
	
	public Boolean update(DtoForJejaUpdate dto, String jEmail) {
		Jeja jeja = dao.findById(jEmail);
		// 후에 예외처리 해야함
		if(jeja==null)
			throw new RuntimeException();
		if(dto.getNewName()!=null) {
			jeja.setJName(dto.getNewName());
			dao.updateJeja(jeja);
			return true;
		}
		if(dto.getJPassword()!=null && dto.getNewPassword()!=null) {
			// 후에 예외처리 다시
			if(pwdEncoder.matches(dto.getJPassword(), jeja.getJPassword())==false)
				throw new RuntimeException();
			jeja.setJPassword(pwdEncoder.encode(dto.getNewPassword()));
			dao.updateJeja(jeja);
			return true;
		}
		if(dto.getNewTel()!=null) {
			jeja.setJTel(dto.getNewTel());
			dao.updateJeja(jeja);
			return true;
		}
		return false;
	}
	
	public String findId(String jName, String jTel) throws UserNotFoundException {
		if(dao.findJNameAndJTelByJejaId(jName, jTel)==null)
			throw new UserNotFoundException();
		return dao.findJNameAndJTelByJejaId(jName, jTel);		
	}
}
