package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.Review;

@Repository
public class ReviewDao {

	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToReview(Review review) {
		return tpl.insert("reviewMapper.insertToReview", review);
	}
	
	public List<Review> findAllReview(int dMno){
		return tpl.selectList("reviewMapper.findAllReview",dMno);
	}
	
	public int deleteToReview(int rNo) {
		return tpl.delete("reviewMapper.deleteToReview",rNo);
	}
	
	public Double avgToReview() {
		return tpl.selectOne("reviewMapper.avgToReview");
	}
	
	public int countToReview() {
		return tpl.selectOne("reviewMapper.countToReview");
	}
	
	public Review findByReview(int rNo) {
		return tpl.selectOne("reviewMapper.findByReview",rNo);
	}
	
	public int updateToReview(Review review) {
		return tpl.update("reviewMapper.updateToReview",review);
	}
}
