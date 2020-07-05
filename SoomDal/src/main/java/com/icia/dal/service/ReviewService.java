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
	@Inject
	private DalinDao dalDao;

	
	// 리뷰 작성
	public List<Review> reviewAuthChkAndWrite(Review rv , String username) {
		Jeja jeja = dao.findById(username);
		String comCode = lhDao.findByCompleteCodeToLH(jeja.getJMno());
		int auth = reviewAuthDao.findCompleteCode(comCode, username);
		if(rv.getDMno()==auth) {
			rv.setRWriter(username);
			reviewDao.insertToReview(rv);
			Dalin dal = Dalin.builder().dMno(rv.getDMno()).rReviewCnt(1).build();
			dalDao.updateToDalinProfile(dal);
			return reviewDao.findAllReview(rv.getDMno());
		}else {
			return null;
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
