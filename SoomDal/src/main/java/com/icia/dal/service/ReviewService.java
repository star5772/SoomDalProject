package com.icia.dal.service;

import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.LessonHistoryDao;
import com.icia.dal.dao.ReviewAuthorityDao;
import com.icia.dal.dao.ReviewDao;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.Review;
import com.icia.dal.entity.ReviewAuthority;


@Service
public class ReviewService {
	@Inject
	private ReviewDao reviewDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private LessonHistoryDao lhDao;
	@Inject
	private ReviewAuthorityDao reviewAuthDao;
	@Inject
	private JejaDao dao;
	
	
	
	
	public boolean reviewAuth(String username,int dMno) {
		Jeja jeja = dao.findById(username);
		String code = lhDao.findByCompleteCodeToLH(jeja.getJMno(),dMno);
		if(code==null)
			code = "aa";
		return reviewAuthDao.findByRvAuth(username, code);
	}
	
	
	
	
}
