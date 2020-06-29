package com.icia.dal.service;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.JejaDto.*;
import com.icia.dal.entity.*;
import com.icia.dal.util.*;

@Service
public class JejaService {
	@Inject
	private JejaDao dao;
	@Inject
	private DAO authDao;
	@Inject
	private PasswordEncoder pwdEncoder;
	@Inject
	private ModelMapper modelMapper;

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
		authDao.insertAuthority(jeja.getJEmail(), "ROLE_JEJA");
	}
	
	public void delete(String jEmail) {
		// 제자 회원탈퇴
		dao.deleteJeja(jEmail);
	}
	
	public JejaDto.DtoForJejaRead read(String jEmail) {
		Jeja jeja = dao.findById(jEmail);
		System.out.println();
		JejaDto.DtoForJejaRead dto = modelMapper.map(jeja,JejaDto.DtoForJejaRead.class);
		dto.setEmail(jeja.getJEmail()).setName(jeja.getJName()).setTel(jeja.getJTel()).setJMno(jeja.getJMno());
		System.out.println(dto);
		return dto;
	}

	public Boolean update(DtoForJejaUpdate dto, String jEmail) {
		Jeja jeja = dao.findById(jEmail);
		// 후에 예외처리 해야함
		if(jeja==null)
			throw new RuntimeException();
		System.out.println("==========");
		System.out.println(dto);
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
	
	
}
