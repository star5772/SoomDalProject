package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.RandomStringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.DAO;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.LessonHistoryDao;
import com.icia.dal.dao.RequestDao;
import com.icia.dal.dto.JejaDto;
import com.icia.dal.dto.JejaDto.DtoForJejaUpdate;
import com.icia.dal.dto.LHDto;
import com.icia.dal.dto.Mail;
import com.icia.dal.dto.page.PageToLessonHistory;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.LessonHistory;
import com.icia.dal.util.MailUtil;
import com.icia.dal.util.pagingutil.LessonHistoryPagingUtil;

@Service
public class JejaService {
	@Inject
	private JejaDao dao;
	@Inject
	private DAO authDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private PasswordEncoder pwdEncoder;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private LessonHistoryDao lhDao;	
	@Inject
	private MailUtil mailUtil;
	@Inject
	private RequestDao reqDao;
	
	
	@Transactional
	public void join(Jeja jeja) {
		String pwd = jeja.getJPassword();
		String encodedPwd = pwdEncoder.encode(pwd);
		jeja.setJPassword(encodedPwd);
		// 나중에 회원가입 실패했을 시 예외처리 다시 해야함
		if(dao.insertJeja(jeja)==0)
			throw new RuntimeException();
		authDao.insertAuthority(jeja.getJEmail(), "ROLE_JEJA");
	}
	@Transactional
	public void delete(String jEmail) {
		// 제자 회원탈퇴
		Jeja jeja = dao.findById(jEmail);
		if(jeja==null)
			throw new RuntimeException();
		authDao.deleteAuthority(jEmail);
		dao.deleteJeja(jEmail);
	}
	
	public JejaDto.DtoForJejaRead read(String jEmail) {
		Jeja jeja = dao.findById(jEmail);
		JejaDto.DtoForJejaRead dto = modelMapper.map(jeja,JejaDto.DtoForJejaRead.class);
		dto.setEmail(jeja.getJEmail()).setName(jeja.getJName()).setTel(jeja.getJTel()).setJMno(jeja.getJMno());
		return dto;
	}

	
	
	public PageToLessonHistory lessonListToJeja(int pageno,int jMno) {
		int countOfLesson = lhDao.countOfLessonToJeja(jMno);
		PageToLessonHistory page = LessonHistoryPagingUtil.getPage(pageno, countOfLesson);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<LessonHistory> lhList = lhDao.findAllByLessonHistoryToJeja(srn, ern, jMno);
		List<LHDto.DtoForList> dtoList = new ArrayList<>();
		for(LessonHistory l:lhList) {
			LHDto.DtoForList dto = modelMapper.map(l,LHDto.DtoForList.class);
			Dalin dal = dalDao.findByDalinToDMno(l.getDMno());
			String str = l.getLStartDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
			dto.setLStartDate(str);
			dto.setDetailFName(dal.getDetailFName());
			dto.setDProfile(dal.getDProfile());
			dto.setDName(dal.getDName());
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;		
	}
	
	
	
	public Jeja findById(String jEmail) throws JejaNotFoundException {
		if(jEmail==null) {
			throw new JejaNotFoundException();
		}
		return dao.findById(jEmail);
	}
	@Transactional
	public void resetPassword(String jEmail, String jTel) throws JejaNotFoundException, MessagingException {
		Jeja jeja = dao.findById(jEmail);
		if(jeja==null)
			throw new JejaNotFoundException();
		if(jeja.getJEmail().equals(jEmail)==false)
			throw new JejaNotFoundException();
		
		String newPassword = RandomStringUtils.randomAlphanumeric(20);
		dao.updateJeja(Jeja.builder().jEmail(jEmail).jPassword(pwdEncoder.encode(newPassword)).build());
		StringBuffer text = new StringBuffer("<p>임시비밀번호를 발급했습니다</p>");
		text.append("<p>임시 비밀번호:").append(newPassword).append("</p>");
		text.append("<p>보안을 위해 로그인 후 바로 비밀번호를 변경하세요</p>");
		Mail mail = Mail.builder().sender("webmaster@icia.com").receiver(jEmail).title("임시비밀번호 발급 안내").content(text.toString()).build();
		mailUtil.sendMail(mail);
	}
	@Transactional
	public void changePwd(@NotNull String jPassword, String newPassword, String jEmail) throws JejaNotFoundException {
		Jeja jeja = dao.findById(jEmail);
		if(jeja==null)
			throw new JejaNotFoundException();
		String encodedPassword = jeja.getJPassword();
		if(pwdEncoder.matches(jPassword, encodedPassword)==true) {
			String newEncodedPassword = pwdEncoder.encode(newPassword);
			dao.updateJeja(Jeja.builder().jPassword(newEncodedPassword).jEmail(jEmail).build());
		}
		 else 
			 throw new JobFailException("비밀번호가 일치하지 않습니다");
		 
	}
	
	public Integer findLessonHistory(int dMno) {
		return reqDao.findRequestByJmno(dMno);
	}
}
