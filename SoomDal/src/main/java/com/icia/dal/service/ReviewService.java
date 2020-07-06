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
	@Inject
	private DalinDao dalDao;

	
	// 리뷰 작성
	public List<Review> reviewAuthChkAndWrite(Review rv , String username,int dMno) {
		// 리뷰작성을위해 레슨내역에서 레슨완료코드를 불러옴
		Jeja jeja = dao.findById(username);
		String comCode = lhDao.findByCompleteCodeToLH(jeja.getJMno(),dMno);
		// 리뷰권한테이블에서 달인 번호를 찾아서 제자가 보유하고있는 레슨내역에서 달인번호를 찾아 있으면 리뷰 작성.
		int auth = reviewAuthDao.findCompleteCode(comCode, username);
		if(rv.getDMno()==auth) {
			rv.setRWriter(username);
			reviewDao.insertToReview(rv);
			// 리뷰테이블에 리뷰 입력후 달인프로필의 reviewCnt 1증가 (리뷰 전체출력을 위한 작업)
			Dalin dal = Dalin.builder().dMno(rv.getDMno()).rReviewCnt(1).build();
			dalDao.updateToDalinProfile(dal);
			// 리뷰작성 완료시 리뷰작성완료여부 레슨내역에 저장
			lhDao.setReviewIsOk(comCode);
			// 리뷰를 한번 작성했으니 재작성 불가능하도록 권한테이블에서 코드삭제.
			reviewAuthDao.deleteByReviewAuthority(comCode);
			return reviewDao.findAllReview(rv.getDMno());
		}else {
			return null;
		}
	}
	
	public boolean reviewAuth(String username,int dMno) {
		Jeja jeja = dao.findById(username);
		String code = lhDao.findByCompleteCodeToLH(jeja.getJMno(),dMno);
		if(code==null)
			code = "aa";
		return reviewAuthDao.findByRvAuth(username, code);
	}
	
	
	
	// 리뷰 지우기
	public List<Review> deleteToReview(int rNo, int dMno, String writer) throws JobFailException {
		Review review = reviewDao.findByReview(rNo);
		if(writer.equals(review.getRWriter())==false)
			throw new JobFailException();
		reviewDao.deleteToReview(rNo);
		return reviewDao.findAllReview(dMno);
	}
}
