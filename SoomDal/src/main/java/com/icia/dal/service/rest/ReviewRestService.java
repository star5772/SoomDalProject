package com.icia.dal.service.rest;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class ReviewRestService {
	@Inject
	private ReviewDao reviewDao;
	
	// 리뷰 지우기
		public List<Review> deleteToReview(int rNo, int dMno, String writer) throws JobFailException {
			Review review = reviewDao.findByReview(rNo);
			if(writer.equals(review.getRWriter())==false)
				throw new JobFailException();
			reviewDao.deleteToReview(rNo);
			return reviewDao.findAllReview(dMno);
		}
}
