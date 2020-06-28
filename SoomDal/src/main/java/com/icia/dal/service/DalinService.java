package com.icia.dal.service;


import java.io.*;
import java.time.*;
import java.util.*;

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
import com.icia.dal.dto.page.PageToDalinField;
import com.icia.dal.entity.*;
import com.icia.dal.util.pagingutil.FieldPagingUtil;

@Service
public class DalinService {
	@Inject
	private DalinDao dalDao;
	@Inject
	private ReviewDao reviewDao;
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
	@Inject
	private ProfileAttachmentDao profileAttachmentDao;

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

	public PageToDalinField findDalinByDetailFName(int pageno,String detailFName) {
		int countOfDalin = dalDao.countOfFieldDalin(detailFName);
		PageToDalinField page = FieldPagingUtil.getPage(pageno, countOfDalin);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Dalin> dalinList = dalDao.findDalinByDetailFName(srn,ern);
		List<DalinDto.DtoForFieldList> dtoList = new ArrayList<>();
		for(Dalin d:dalinList) {
			DalinDto.DtoForFieldList dto = modelMapper.map(d,DalinDto.DtoForFieldList.class);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	// 달인 프로필 읽기
	public DalinDto.DtoForProfileToDalin readToDalinProfile(int dMno) throws DalinNotFoundException{
		Dalin dalin = dalDao.findByDalinProfile(dMno);
		if(dalin==null) 
		{
			throw new DalinNotFoundException();
		}
		DalinDto.DtoForProfileToDalin dto = modelMapper.map(dalin, DalinDto.DtoForProfileToDalin.class);
		if(dalin.getPAttachmentCnt()>0) // 사진 수가 있으면 다 보여주라고
			dto.setProfileAttachments(profileAttachmentDao.findAllByProfileAttachment(dto.getDMno()));
		if(dalin.getRReviewCnt()>0)
			dto.setReviews(reviewDao.findAllReview(dto.getDMno()));
		return dto;
	}
}	


