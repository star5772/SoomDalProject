package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.icia.dal.entity.*;

public interface RequestBoardDao {
	// 요청서 게시판 글읽기????
	public List<RequestBoard> findAllByRbno(int rbNo);
	
	public int insert(RequestBoard requestBoard);
	
	@Delete("delete from RequestBoard where RB_NO=#{rbNo} and rownum=1")
	public int delete(int rbNo);
	
	public int RequestBoardUpdate(RequestBoard requestBoard);
	
	public RequestBoard findByRequestBoard(int rbNo);
	
	public int RequestBoardToCount(String rbWriter);
	
	public List<RequestBoard> findAll(@Param("startRowNum") int startRowNum, @Param("endRowNum") int endRowNum);
	
	public List<RequestBoard> findAllByRbWriter(@Param("startRowNum") int startRowNum, @Param("endRowNum") int endRowNum, @Param("rbWriter") String rbWriter);
	
}
