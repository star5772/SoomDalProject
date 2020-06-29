package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.UserNotFoundException;
import com.icia.dal.dao.DAO;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.LessonHistoryDao;
import com.icia.dal.dto.JejaDto;
import com.icia.dal.dto.JejaDto.DtoForJejaUpdate;
import com.icia.dal.dto.LHDto;
import com.icia.dal.dto.page.PageToLessonHistory;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.LessonHistory;
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
		Jeja jeja = dao.findById(jEmail);
		if(jeja==null)
			throw new RuntimeException();
		authDao.deleteAuthority(jEmail);
		dao.deleteJeja(jEmail);
	}
	
	public JejaDto.DtoForJejaRead read(String jEmail) {
		Jeja jeja = dao.findById(jEmail);
		System.out.println();
		JejaDto.DtoForJejaRead dto = modelMapper.map(jeja,JejaDto.DtoForJejaRead.class);
		dto.setEmail(jeja.getJEmail()).setName(jeja.getJName()).setTel(jeja.getJTel()).setJMno(jeja.getJMno());
		System.out.println("------Dto---------"+dto);
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
	
	public String findId(String jName, String jTel) throws UserNotFoundException {
		if(dao.findJNameAndJTelByJejaId(jName, jTel)==null)
			throw new UserNotFoundException();
		return dao.findJNameAndJTelByJejaId(jName, jTel);		
	}
	
	public Jeja findById(String jEmail) {
		return dao.findById(jEmail);
	}
}
