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
		// 로그인 한 아이디로 달인 정보를 찾음
		Dalin dalin = dalDao.findByDalin(dEmail);
		// 찾은 달인의 정보가 null 이라면 RuntimeException 발생
		if(dalin==null)
			throw new RuntimeException();
		// 변경할 이름을 입력받았다면 달인 정보의 이름을 입력받은 값으로 변경후 업데이트
		if(dto.getDName()!=null) {
			dalin.setDName(dto.getDName());
			dalDao.updateToDalin(dalin);
			return true;
		}
		// 현재비밀번호와 변경할 비밀번호 모두 입력받았다면
		if(dto.getDPassword()!=null && dto.getNewDPassword()!=null) {
		// PasswordEncoder객체를 이용해 현재비밀번호와 해싱된 비밀번호를 비교	
			if(pwdEncoder.matches(dto.getDPassword(), dalin.getDPassword())==false)
		// 일치하지 않으면 RuntimeException 발생		
				throw new RuntimeException();
		// 일치하면 변경할 비밀번호를 해싱후 달인정보에 저장된 비밀번호로 변경	
			dalin.setDPassword(pwdEncoder.encode(dto.getNewDPassword()));
		// 변경한 값 업데이트	
			dalDao.updateToDalin(dalin);
			return true;
		}
		// 변경할 연락처를 입력받았다면
		if(dto.getDTel()!=null) {
		// 입력받은 연락처로 달인정보 변경	
			dalin.setDTel(dto.getDTel());
		// 변경한값 업데이트	
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
			throw new RuntimeException();
		// 신고테이블 추가
		dalDao.reportJeja(dMno,jMno,reason);
		// 신고 횟수 증가
		jejaDao.updateJeja(Jeja.builder().jAccusationCnt(1).jEmail(jEmail).build());
	}
}
