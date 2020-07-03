package com.icia.dal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.icia.dal.entity.ReviewAuthority;

public interface ReviewAuthorityDao {
	
	@Insert("insert into ReviewAuthority(a_complete_code,d_mno,j_mno,a_is_ok)values(#{r.aCompleteCode},#{r.dMno},#{r.jMno},1,#{r.j_email})")
	public int insertReviewAuthority(@Param("r")ReviewAuthority ra);
	
	@Select("select * from ReviewAuthority where a_complete_code = #{aCompleteCode} and rownum=1")
	public ReviewAuthority findByReviewAuthority(String aCompleteCode);
	
	@Delete("delete from ReviewAuthority where  a_complete_code = #{aCompleteCode} and rownum=1")
	public int deleteByReviewAuthority(String aCompleteCode);
	
	@Select("select a_complete_code aCompleteCode,d_mno dMno, j_mno jMno, a_is_ok aIsOk, j_email jEmail from reviewAuthority where d_mno =#{dMno}")
	public List<ReviewAuthority> findAllByReviewAuth(int dMno);
}

