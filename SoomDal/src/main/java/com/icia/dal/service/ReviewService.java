package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.LessonHistoryDao;
import com.icia.dal.dao.ReviewAuthorityDao;
import com.icia.dal.dao.ReviewDao;
import com.icia.dal.dto.NowPaymentDto;
import com.icia.dal.dto.ReviewDto;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.LessonHistory;
import com.icia.dal.entity.Review;


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

	
	// 리뷰 작성
	public boolean reviewAuthChkAndWrite(Review rv , String username) {
		Jeja jeja = dao.findById(username);
		String comCode = lhDao.findByCompleteCodeToLH(jeja.getJMno());
		
		int auth = reviewAuthDao.findCompleteCode(comCode, username);
		System.out.println("auth: --------------------------" + auth);
		
		System.out.println("rv.getdMno: ===================================================" +rv.getDMno());
		if(rv.getDMno()==auth) {
			reviewDao.insertToReview(rv);
			return true; 
		}else {
			return false;
		}
	}
	
	// 리뷰 읽기
	


	
	// 리뷰 지우기
	public List<Review> deleteToReview(int rNo, int dMno, String writer) throws JobFailException {
		Review review = reviewDao.findByReview(rNo);
		if(writer.equals(review.getRWriter())==false)
			throw new JobFailException();
		reviewDao.deleteToReview(rNo);
		return reviewDao.findAllReview(dMno);
	}

	// 리뷰 평균내기
}
