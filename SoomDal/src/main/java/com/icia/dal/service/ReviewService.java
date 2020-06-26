package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.ReviewDao;
import com.icia.dal.dto.NowPaymentDto;
import com.icia.dal.dto.ReviewDto;
import com.icia.dal.entity.Review;


@Service
public class ReviewService {
	@Inject
	private ReviewDao reviewDao;
	@Inject
	private ModelMapper modelMapper;

	
	// 리뷰 작성
	
	
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
