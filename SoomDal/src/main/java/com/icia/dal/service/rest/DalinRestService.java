package com.icia.dal.service.rest;

import javax.inject.*;

import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.entity.*;

@Service
public class DalinRestService {
	@Inject
	private DalinDao dalDao;
	@Inject
	private JejaDao jejaDao;
	@Inject
	private PasswordEncoder pwdEncoder;
	
	public boolean checkId(String dEmail) throws MembernameExistException {
		if(dalDao.existsById(dEmail)==true)
			throw new MembernameExistException();
		return true;
	}
	@Transactional
	public boolean update(DalinDto.DtoForUpdateToDalin dto, String dEmail) {
		Dalin dalin = dalDao.findByDalin(dEmail);
		System.out.println(dto);
		if(dalin==null)
			throw new RuntimeException();
		if(dto.getDName()!=null) {
			dalin.setDName(dto.getDName());
			dalDao.updateToDalin(dalin);
			return true;
		}
		if(dto.getDPassword()!=null && dto.getNewDPassword()!=null) {
			if(pwdEncoder.matches(dto.getDPassword(), dalin.getDPassword())==false)
				throw new RuntimeException();
			dalin.setDPassword(pwdEncoder.encode(dto.getNewDPassword()));
			dalDao.updateToDalin(dalin);
			return true;
		}
		if(dto.getDTel()!=null) {
			dalin.setDTel(dto.getDTel());
			dalDao.updateToDalin(dalin);
			return true;
		}
		return false;
	}
	
	public String findId(String dName, String dTel) throws UserNotFoundException {
		if(dalDao.findJNameAndJTelByDalinId(dName, dTel)==null)
			throw new UserNotFoundException();
		return dalDao.findJNameAndJTelByDalinId(dName, dTel);
	}
	@Transactional
	public void report(String jEmail, String dEmail, String reason) throws JejaNotFoundException {
		// 신고하려는 제자 없으면 예외
		if(jejaDao.findById(jEmail)==null)
			throw new JejaNotFoundException();
		// 정보 찾기
		int dMno = dalDao.findByDalin(dEmail).getDMno();
		int jMno = jejaDao.findById(jEmail).getJMno();
		// 중복으로 신고하면 예외
		if(dalDao.findReportDalin(dMno,jMno)==true)
			throw new JobFailException("같은사람을 여러번 신고 할 수없습니다");
		// 신고테이블 추가
		dalDao.reportJeja(dMno,jMno,reason);
		// 신고 횟수 증가
		jejaDao.updateJeja(Jeja.builder().jAccusationCnt(1).jEmail(jEmail).build());
	}
}
