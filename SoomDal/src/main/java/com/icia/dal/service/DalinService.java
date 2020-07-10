package com.icia.dal.service;


import java.io.*;
import java.security.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.inject.*;
import javax.mail.*;
import javax.validation.*;
import javax.validation.constraints.*;

import org.apache.commons.lang.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.DalinDto.*;
import com.icia.dal.dto.page.*;
import com.icia.dal.entity.*;
import com.icia.dal.util.*;
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
	@Inject
	private MailUtil mailUtil;
	@Inject
	private DetailFieldDao detailFieldDao;

	@Transactional
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
		String area = addr.substring(0, gu+1);
		dalin.setDArea(area);
		dalDao.insertToDalin(dalin);
	}

	
	@Transactional
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

	@Transactional
	public void profileUpdate(DalinDto.DtoForProfileUpdateToDalin dto, MultipartFile dProfile, MultipartFile profileAttachment0, MultipartFile profileAttachment1, MultipartFile profileAttachment2, MultipartFile profileAttachment3 ,MultipartFile profileAttachment4, String dEmail) throws IllegalStateException, IOException, DalinNotFoundException {
		Dalin dalin = dalDao.findByDalin(dEmail);
		if(dalin==null)
			throw new DalinNotFoundException();
		Dalin updateDalin = Dalin.builder().dMno(dto.getDMno()).dIntro(dto.getDIntro()).dMainService(dto.getDMainService()).dArea(dto.getDArea()).dDetailService(dto.getDDetailService()).dPaymentMethod(dto.getDPaymentMethod()).build();
		RepQuestion repQ = RepQuestion.builder().dEmail(dEmail).firstQ(dto.getQ1()).secoendQ(dto.getQ2()).thirdQ(dto.getQ3()).fourthQ(dto.getQ4()).build();
		// repQ // dto와 repQ 값이 달라지지 않았어도 무조건 업데이트
		if(repDao.findByDemail(dEmail)!=null) {
			repDao.update(repQ);
		} else {
			repDao.insert(repQ);
		}
		// dProfile
		if(dProfile!=null && dProfile.isEmpty()==false && dalin.getDProfile()!=null) {
			// 처음으로 프로필 등록이면 바로 update, 처음이 아니면 profileFolder 내부에 이전 프로필 삭제하고 다시 등록
			String ext = dalin.getDProfile().substring(dalin.getDProfile().lastIndexOf(".") + 1);
			File deleteFile = new File(profileFolder+"/"+dEmail+"."+ext);
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
			int lastIndexOfDot =  dProfile.getOriginalFilename().lastIndexOf('.');
			String extension = dProfile.getOriginalFilename().substring(lastIndexOfDot+1);
			File profile = new File(profileFolder, dalin.getDEmail() + "." + extension);
			dProfile.transferTo(profile);
			updateDalin.setDProfile(profilePath + profile.getName());
		} else if(dProfile!=null && dProfile.isEmpty()==false && dalin.getDProfile()==null) {
			int lastIndexOfDot =  dProfile.getOriginalFilename().lastIndexOf('.');
			String extension = dProfile.getOriginalFilename().substring(lastIndexOfDot+1);
			File profile = new File(profileFolder, dalin.getDEmail() + "." + extension);
			dProfile.transferTo(profile);
			updateDalin.setDProfile(profilePath + profile.getName());
		}
		// Attachment
		// 처음으로 프로필을 수정했을 때 첨부파일을 첨부하면
		if(dalin.getPAttachmentCnt()==0) {
			int cnt = 0;
			if(profileAttachment0!=null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment0.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(1);
				File file = new File(profileFolder, saveFileName);
				profileAttachment0.transferTo(file);
				profileAttachmentDao.insert(pfam);
				cnt++;
			}
			if(profileAttachment1!=null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment1.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(2);
				File file = new File(profileFolder, saveFileName);
				profileAttachment1.transferTo(file);
				profileAttachmentDao.insert(pfam);
				cnt++;
			}
			if(profileAttachment2!=null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment2.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(3);
				File file = new File(profileFolder, saveFileName);
				profileAttachment2.transferTo(file);
				profileAttachmentDao.insert(pfam);
				cnt++;
			}
			if(profileAttachment3!=null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment3.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(4);
				File file = new File(profileFolder, saveFileName);
				profileAttachment3.transferTo(file);
				profileAttachmentDao.insert(pfam);
				cnt++;
			}
			if(profileAttachment4!=null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment4.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(5);
				File file = new File(profileFolder, saveFileName);
				profileAttachment4.transferTo(file);
				profileAttachmentDao.insert(pfam);
				cnt++;
			}
			updateDalin.setPAttachmentCnt(cnt);
			
		} else if(dalin.getPAttachmentCnt()!=0) {
			// 내가 올린 파일이 attachDao.findbyId에 존재하면 업데이트(동시에 이전 파일 삭제) 아니면 insert
			if(profileAttachment0!=null && profileAttachmentDao.findByIdAndNum(dEmail,1)!=null) {
				String ext = profileAttachmentDao.findByIdAndNum(dEmail,1).getPSaveFileName().substring(profileAttachmentDao.findByIdAndNum(dEmail,1).getPSaveFileName().lastIndexOf(".") + 1);
				File deleteFile = new File(profileFolder+"/"+profileAttachmentDao.findByIdAndNum(dEmail,1).getPSaveFileName()+"."+ext);
				deleteFile.delete();
				
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment0.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setDEmail(dEmail).setNum(1);
				File file = new File(profileFolder, saveFileName);
				profileAttachment0.transferTo(file);
				profileAttachmentDao.update(pfam);
			} else if(profileAttachment0!=null && profileAttachmentDao.findByIdAndNum(dEmail,1)==null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment0.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(1);
				File file = new File(profileFolder, saveFileName);
				profileAttachment0.transferTo(file);
				profileAttachmentDao.insert(pfam);
			}
			
			if(profileAttachment1!=null && profileAttachmentDao.findByIdAndNum(dEmail,2)!=null) {
				String ext = profileAttachmentDao.findByIdAndNum(dEmail,2).getPSaveFileName().substring(profileAttachmentDao.findByIdAndNum(dEmail,2).getPSaveFileName().lastIndexOf(".") + 1);
				File deleteFile = new File(profileFolder+"/"+profileAttachmentDao.findByIdAndNum(dEmail,2).getPSaveFileName()+"."+ext);
				deleteFile.delete();
				
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment1.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setDEmail(dEmail).setNum(2);
				File file = new File(profileFolder, saveFileName);
				profileAttachment1.transferTo(file);
				profileAttachmentDao.update(pfam);
			} else if(profileAttachment1!=null && profileAttachmentDao.findByIdAndNum(dEmail,2)==null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment1.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(2);
				File file = new File(profileFolder, saveFileName);
				profileAttachment1.transferTo(file);
				profileAttachmentDao.insert(pfam);
			}
			
			if(profileAttachment2!=null && profileAttachmentDao.findByIdAndNum(dEmail,3)!=null) {
				String ext = profileAttachmentDao.findByIdAndNum(dEmail,3).getPSaveFileName().substring(profileAttachmentDao.findByIdAndNum(dEmail,3).getPSaveFileName().lastIndexOf(".") + 1);
				File deleteFile = new File(profileFolder+"/"+profileAttachmentDao.findByIdAndNum(dEmail,3).getPSaveFileName()+"."+ext);
				deleteFile.delete();
				
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment2.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setDEmail(dEmail).setNum(3);
				File file = new File(profileFolder, saveFileName);
				profileAttachment2.transferTo(file);
				profileAttachmentDao.update(pfam);
			} else if(profileAttachment2!=null && profileAttachmentDao.findByIdAndNum(dEmail,3)==null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment2.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(3);
				File file = new File(profileFolder, saveFileName);
				profileAttachment2.transferTo(file);
				profileAttachmentDao.insert(pfam);
			}
			
			if(profileAttachment3!=null && profileAttachmentDao.findByIdAndNum(dEmail,4)!=null) {
				String ext = profileAttachmentDao.findByIdAndNum(dEmail,4).getPSaveFileName().substring(profileAttachmentDao.findByIdAndNum(dEmail,4).getPSaveFileName().lastIndexOf(".") + 1);
				File deleteFile = new File(profileFolder+"/"+profileAttachmentDao.findByIdAndNum(dEmail,4).getPSaveFileName()+"."+ext);
				deleteFile.delete();
				
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment3.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setDEmail(dEmail).setNum(4);
				File file = new File(profileFolder, saveFileName);
				profileAttachment3.transferTo(file);
				profileAttachmentDao.update(pfam);
			} else if(profileAttachment3!=null && profileAttachmentDao.findByIdAndNum(dEmail,4)==null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment3.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(4);
				File file = new File(profileFolder, saveFileName);
				profileAttachment3.transferTo(file);
				profileAttachmentDao.insert(pfam);
			}
			
			if(profileAttachment4!=null && profileAttachmentDao.findByIdAndNum(dEmail,5)!=null) {
				String ext = profileAttachmentDao.findByIdAndNum(dEmail,5).getPSaveFileName().substring(profileAttachmentDao.findByIdAndNum(dEmail,5).getPSaveFileName().lastIndexOf(".") + 1);
				File deleteFile = new File(profileFolder+"/"+profileAttachmentDao.findByIdAndNum(dEmail,5).getPSaveFileName()+"."+ext);
				deleteFile.delete();
				
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment4.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setDEmail(dEmail).setNum(5);
				File file = new File(profileFolder, saveFileName);
				profileAttachment4.transferTo(file);
				profileAttachmentDao.update(pfam);
			} else if(profileAttachment4!=null && profileAttachmentDao.findByIdAndNum(dEmail,5)==null) {
				ProfileAttachment pfam = new ProfileAttachment();
				String originalFileName = profileAttachment4.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				pfam.setDEmail(dEmail).setPOriginalFileName(originalFileName).setPSaveFileName(profilePath+saveFileName).setNum(5);
				File file = new File(profileFolder, saveFileName);
				profileAttachment4.transferTo(file);
				profileAttachmentDao.insert(pfam);
			}
			
		}
		// dto
		dalDao.updateToDalinProfile(updateDalin);
	}

	

	public PageToDalinField findDalinByDetailFName(int pageno,String detailFName,String searchType,String keyword) {
		int countOfDalin = dalDao.countOfFieldDalin(detailFName,searchType,keyword);
		PageToDalinField page = FieldPagingUtil.getPage(pageno, countOfDalin);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Dalin> dalinList = dalDao.findDalinByDetailFName(srn,ern,detailFName,searchType,keyword);
		List<DalinDto.DtoForFieldList> dtoList = new ArrayList<>();
		for(Dalin d:dalinList) {
			DalinDto.DtoForFieldList dto = modelMapper.map(d,DalinDto.DtoForFieldList.class);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		page.setKeyword(keyword);
		page.setSearchType(searchType);
		return page;
	}
	
	// 제자가 달인 프로필 읽기
	public DalinDto.DtoForProfileToDalin readToDalinProfile(int dMno) throws DalinNotFoundException{
		Dalin dalin = dalDao.findByDalinProfile(dMno);
		String dEmail = dalin.getDEmail();
		if(dalin==null || dEmail==null) {
			throw new DalinNotFoundException();
		}
		DalinDto.DtoForProfileToDalin dto = modelMapper.map(dalin, DalinDto.DtoForProfileToDalin.class);
		if(dalin.getPAttachmentCnt()!=0) // 사진 수가 있으면 다 보여주라고
			dto.setProfileAttachments(profileAttachmentDao.findAllById(dEmail));
		if(dalin.getRReviewCnt()>0) {
			dto.setReviews(reviewDao.findAllReview(dto.getDMno()));
			dto.setRScoreAverage(reviewDao.avgToReview(dto.getDMno()));
		}
		// 달인이 대표질문을 달았으면 추가 없으면 null
		if(repDao.findByDemail(dEmail)!=null)
			dto.setRep(repDao.findByDemail(dEmail));
		return dto;
	}

	// 달인 본인 프로필읽기
	public DalinDto.DtoForProfileToDalin readToMyProfile(String dEmail) throws DalinNotFoundException{
		Dalin dalin = dalDao.findByMyProfile(dEmail);
		if(dalin==null) {
			throw new DalinNotFoundException();
		}
		DalinDto.DtoForProfileToDalin dto = modelMapper.map(dalin, DalinDto.DtoForProfileToDalin.class);
		if(dalin.getPAttachmentCnt()!=0) // 사진 수가 있으면 다 보여주라고
			dto.setProfileAttachments(profileAttachmentDao.findAllById(dEmail));
		if(dalin.getRReviewCnt()>0) {
			dto.setReviews(reviewDao.findAllReview(dto.getDMno()));
			dto.setRScoreAverage(reviewDao.avgToReview(dto.getDMno()));
		}
		// 달인이 대표질문을 달았으면 추가 없으면 null
		if(repDao.findByDemail(dEmail)!=null)
			dto.setRep(repDao.findByDemail(dEmail));
		return dto;
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
	
	@Transactional
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
	
	
	
	@Transactional
	public List<Review> deleteReview(Integer rNo,Integer dMno,String writer) {
		Review rv = reviewDao.findByReview(rNo);
		if(writer.equals(rv.getRWriter())==false)
			throw new JobFailException("작성자만 삭제 할 수 있습니다");
		reviewDao.deleteToReview(rNo);
		return reviewDao.findAllReview(dMno);
	}
	

	@Transactional
	public boolean resetPassword(String dEmail, String dTel) throws MessagingException, DalinNotFoundException {
		Dalin dalin = dalDao.findByDalin(dEmail);
		if(dalin==null )
			throw new DalinNotFoundException();
		if(dalin.getDEmail().equals(dEmail)==false || dalin.getDTel().equals(dTel)==false)
			throw new DalinNotFoundException();
		else {
			String newPassword = RandomStringUtils.randomAlphanumeric(20);
			dalDao.updateToDalin(Dalin.builder().dEmail(dEmail).dPassword(pwdEncoder.encode(newPassword)).enabled(true).build());
			StringBuffer text = new StringBuffer("<p>임시비밀번호를 발급했습니다</p>");
			text.append("<p>임시 비밀번호:").append(newPassword).append("</p>");
			text.append("<p>보안을 위해 로그인 후 바로 비밀번호를 변경하세요</p>");
			Mail mail = Mail.builder().sender("webmaster@icia.com").receiver(dEmail).title("임시비밀번호 발급 안내").content(text.toString()).build();
			mailUtil.sendMail(mail);
			return true;
		}
	}
	
	@Transactional
	public void changePwd(String dPassword, String newPassword, String dEmail) throws DalinNotFoundException {
		Dalin dalin = dalDao.findByDalin(dEmail);
		if(dalin==null)
			throw new DalinNotFoundException();
		String encodedPassword = dalin.getDPassword();
		if(pwdEncoder.matches(dPassword, encodedPassword)==true) {
			String newEncodedPassword = pwdEncoder.encode(newPassword);
			dalDao.updateToDalin(Dalin.builder().dPassword(newEncodedPassword).dEmail(dEmail).build());
		}
		else 
			throw new JobFailException("비밀번호가 일치하지 않습니다");
		 
	}
	
	public DetailField fieldInfo(String detailFName) {
		return detailFieldDao.findByDetailFName(detailFName);
	}
}

