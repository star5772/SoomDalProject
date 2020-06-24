package com.icia.dal.service;

import java.time.LocalDateTime;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.dao.DAO;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dto.DalinDto;
import com.icia.dal.dto.DalinDto.DtoForJoinToDalin;
import com.icia.dal.dto.DalinDto.DtoForProfileToDalin;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Level;

@Service
public class DalinService {
	@Inject
	private DalinDao dalDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private DAO dao;
	@Inject
	private PasswordEncoder pwdEncoder;

	public void join(DtoForJoinToDalin dto) {
		Dalin dalin = modelMapper.map(dto, Dalin.class);
		// 레벨 초기설정값 = 노말
		dalin.setDLevel(Level.NORMAL);
		// 비밀번호 해싱
		String password = dalin.getDPassword();
		String encodePwd = pwdEncoder.encode(password);
		dalin.setDPassword(encodePwd);
		// 권한추가 기본권한 = ROLE_DALIN
		dao.insertAuthority(dalin.getDEmail(), "ROLE_DALIN");
		// 가입일 현재시간으로 변경
		dalin.setDDate(LocalDateTime.now());
		// 가입지역 "지역구"만 저장
		String addr = dalin.getDArea();
		int city = addr.indexOf("시");
		int gu = addr.indexOf("구");
		String area = addr.substring(city+1 , gu+1);
		dalin.setDArea(area);
		System.out.println(area);
		System.out.println(dalin);
		dalDao.insertToDalin(dalin);
	}

	public boolean checkId(String dEmail) throws MembernameExistException {
		if(dalDao.existsById(dEmail)==true)
			throw new MembernameExistException();
		return true;
	}

	public void delete(String dEmail) {
		dalDao.deleteToDalin(dEmail);
	}
	
	public DalinDto.DtoForProfileToDalin profileRead(int dMno) {
		Dalin dalin = dalDao.findByDalin(dMno);
		DalinDto.DtoForProfileToDalin dto = modelMapper.map(dalin, DalinDto.DtoForProfileToDalin.class);
		return dto;
	}
}	


