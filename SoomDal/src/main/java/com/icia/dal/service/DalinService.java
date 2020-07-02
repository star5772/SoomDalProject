package com.icia.dal.service;


import java.io.*;
import java.security.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.inject.*;
import javax.validation.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.DalinDto.*;
import com.icia.dal.dto.page.*;
import com.icia.dal.entity.*;
import com.icia.dal.util.pagingutil.*;

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
	@Value("${profileFolder}")
	private String profileFolder;
	@Value("${profilePath}")
	private String profilePath;
	@Inject
	private ProfileAttachmentDao profileAttachmentDao;
	@Inject
	private RepQuestionDao repDao;
	

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
		int gu = addr.indexOf("구");
		System.out.println(addr + "---------------------------------------------------------");
		String area = addr.substring(0, gu+1);
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
		if(dalDao.findByDalin(dEmail)==null)
			throw new RuntimeException();
		dalDao.deleteToDalin(dEmail);
		dao.deleteAuthority(dEmail);
	}
	
	
	public DalinDto.DtoForMyInfo readToMyInfo(String username) throws UserNotFoundException {
		Dalin dalin = dalDao.findByDalin(username);
		if(dalin==null)
			throw new UserNotFoundException();
		DalinDto.DtoForMyInfo dto = modelMapper.map(dalin,DalinDto.DtoForMyInfo.class);
		Level lev = dalin.getDLevel();
		dto.setDLevelStr(lev.name());
		return dto;
	}

	
<<<<<<< HEAD
	public void profileUpdate(DtoForProfileToDalin dto, MultipartFile sajin) throws IllegalStateException, IOException {
=======
	public void profileUpdate(DalinDto.DtoForProfileUpdateToDalin dto, MultipartFile sajin) throws IllegalStateException, IOException {
>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
		Dalin dalin = modelMapper.map(dto, Dalin.class);
		if(dto.getProfileAttachments() != null)
			dalin.setPAttachmentCnt(dto.getProfileAttachments().size());
		else
			dalin.setPAttachmentCnt(0);
		dalDao.updateToDalinProfile(dalin);
		
		List<MultipartFile> attachments = dto.getProfileAttachments();
		if(attachments != null) {
			for(MultipartFile mf: attachments) {
				ProfileAttachment pattachment = new ProfileAttachment();
				String originalFName = mf.getOriginalFilename();
				long time = System.nanoTime();
				String saveFName = time + "-" + originalFName;
				boolean isImage = mf.getContentType().toLowerCase().startsWith("image/");
				pattachment.setDMno(dalin.getDMno()).setPIsOk(isImage).setPOriginalFileName(originalFName).setPSaveFileName(saveFName);
				File file = new File("c:/project/attachment",saveFName);
				FileCopyUtils.copy(mf.getBytes(), file);
				profileAttachmentDao.insertToProfileAttachment(pattachment);
			}
		}
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

	public PageToDalinField findDalinByDetailFName(int pageno,String detailFName) {
		int countOfDalin = dalDao.countOfFieldDalin(detailFName);
		PageToDalinField page = FieldPagingUtil.getPage(pageno, countOfDalin);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Dalin> dalinList = dalDao.findDalinByDetailFName(srn,ern,detailFName);
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
		if(dalin.getPAttachmentCnt()!=0) // 사진 수가 있으면 다 보여주라고
			dto.setProfileAttachments(profileAttachmentDao.findAllByProfileAttachment(dto.getDMno()));
		if(dalin.getRReviewCnt()>0)
			dto.setReviews(reviewDao.findAllReview(dto.getDMno()));
		if(dalin.getDQNo()!=0)
			dto.setRep(repDao.findAllToRequestion(dalDao.findByDalinToDMno(dMno).getDEmail()));
		return dto;
	}

	public String findId(String dName, String dTel) throws UserNotFoundException {
		if(dalDao.findJNameAndJTelByDalinId(dName, dTel)==null)
			throw new UserNotFoundException();
		return dalDao.findJNameAndJTelByDalinId(dName, dTel);
	}

	public PageToSearch dalSearch(int pageno, String searchType, String keyword) {
		int countOfSearch = dalDao.countOfSearch(searchType,keyword);
		PageToSearch page = SearchPagingUtil.getPage(pageno, countOfSearch);
		List<Dalin> list = dalDao.findDalinBySearch(page.getStartRowNum(),page.getEndRowNum(),searchType,keyword);
		List<DalinDto.DtoForFieldList> dtoList = new ArrayList<>();
		for(Dalin d:list) {
			DalinDto.DtoForFieldList dto = modelMapper.map(d,DalinDto.DtoForFieldList.class);
			Double avg = reviewDao.avgToReview(d.getDMno())==null?0:reviewDao.avgToReview(d.getDMno());
			dto.setAvgScore(Double.parseDouble(String.format("%.1f", avg)));
			dtoList.add(dto);
		}
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		page.setList(dtoList);
		return page;
	}
	
	public Dalin findById(String dEmail) {
		return dalDao.findByDalin(dEmail);
	}
	
<<<<<<< HEAD
	public void profileSajin(DalinDto.DtoForProfileToDalin dto, MultipartFile sajins) throws IllegalStateException, IOException {
		Dalin dalin = modelMapper.map(dto, Dalin.class);
		
		if(sajins!=null && sajins.isEmpty()==false) {
			if(sajins.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajins.getOriginalFilename().lastIndexOf('.');
				String extension = sajins.getOriginalFilename().substring(lastIndexOfDot+1);
				File profile = new File(profileFolder, dalin.getDEmail() + "." + extension);
				
				sajins.transferTo(profile);
				dalin.setDProfile(profilePath + profile.getName());
			}
		}
	}
=======

>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
}

