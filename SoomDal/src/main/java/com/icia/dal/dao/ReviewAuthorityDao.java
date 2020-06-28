package com.icia.dal.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.icia.dal.entity.ReviewAuthority;

public interface ReviewAuthorityDao {
	
	@Insert("insert into ReviewAuthority(a_complete_code,d_mno,j_mno,a_is_ok)values(#{r.aCompleteCode},#{r.dMno},#{r.jMno},1)")
	public int insertReviewAuthority(@Param("r")ReviewAuthority ra);
	
	@Select("select * from ReviewAuthority where a_complete_code = #{aCompleteCode} and rownum=1")
	public ReviewAuthority findByReviewAuthority(String aCompleteCode);
	
	@Delete("delete from ReviewAuthority where  a_complete_code = #{aCompleteCode} and rownum=1")
	public int deleteByReviewAuthority(String aCompleteCode);
}
