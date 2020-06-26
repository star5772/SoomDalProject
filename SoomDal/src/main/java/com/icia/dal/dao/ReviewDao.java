package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.icia.dal.entity.*;

public interface ReviewDao {
	
	// 리뷰 작성
	@Insert("insert into Review values(#{r.rNo}, sysdate, #{r.rContent}, 0, 0, #{r.rWriter}, #{r.sNo})")
	public int insert(@Param("r")Review review);
	
	// 리뷰 리뷰번호로 삭제
	@Delete("delete from Review where R_NO=#{rNo} and rownum=1")
	public int delete(int rno);
	
	// 리뷰 글보기
	@Select("select R_NO rNo, R_DATE rDate, R_CONTENT rContent, R_SCORE rScore, R_SAJIN_CNT rSajinCnt, R_WRITER rWriter, S_NO sNo from Review where R_NO=#{rNo}")
	public List<Review> findAllByRno(int rNo);
	
	// 리뷰 평균내기
	
	@Select("select avg(r_score ) from review where r_writer=#{rWriter}")
	public int avgAllReview(String rWriter);
}
