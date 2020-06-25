package com.icia.dal.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.io.*;
import java.time.*;

import javax.inject.*;
import javax.validation.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.DalinDto.*;
import com.icia.dal.entity.*;

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
	@Value("d:/project/profile")
	private String profileFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;

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
	
	public DalinDto.DtoForProfileToDalin profileRead(String dEmail) {
		Dalin dalin = dalDao.findByDalin(dEmail);
		DalinDto.DtoForProfileToDalin dto = modelMapper.map(dalin, DalinDto.DtoForProfileToDalin.class);
		return dto;
	}
	
	public void profileUpdate(DtoForUpdateToDalinProfile dto, MultipartFile sajin) throws IllegalStateException, IOException {
		Dalin dalin = modelMapper.map(dto, Dalin.class);
		if(sajin!=null && !sajin.isEmpty()) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File file = new File(profileFolder, dalin.getDMno() + "." + extension);
				sajin.transferTo(file);
				dalin.setDProfile(profilePath + file.getName());
			}
		}
		dalDao.updateToDalinProfile(dalin);
	}

	public void update(@Valid DalinDto.DtoForUpdateToDalin dto) {
		Dalin dalin = modelMapper.map(dto, Dalin.class);
		String pwd = pwdEncoder.encode(dto.getNewDPassword());
		dalin.setDPassword(pwd);
		dalDao.updateToDalin(dalin);
	}
}	


