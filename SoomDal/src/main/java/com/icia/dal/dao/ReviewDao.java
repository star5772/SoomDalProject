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
	
	public List<Review> findAllReview(int startRowNum, int endRowNum){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("reviewMapper.findAllReview",map);
	}
	
	public int deleteToReview(int rNo) {
		return tpl.delete("reviewMapper.deleteToReview",rNo);
	}
	
	public Double avgToReview() {
		return tpl.selectOne("reviewMapper.avgToReview");
	}
}
