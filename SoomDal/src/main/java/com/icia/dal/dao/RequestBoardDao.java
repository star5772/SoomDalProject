package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.icia.dal.entity.*;

public interface RequestBoardDao {
	// 요청서 게시판 글읽기
	@Select("select RB_NO rbNo, RB_TITLE rbTitle, RB_CONTENT rbContent, RB_WRITE_DATE rbWriteDate, RB_READ_CNT rbReadCnt, R_NO rNo, J_MNO jMno from RequestBoard where RB_NO=#{rbNo}")
	public List<RequestBoard> findAllByRbno(int rbNo);
	
	public int insert(RequestBoard requestBoard);
	
	@Delete("delete from RequestBoard where RB_NO=#{rbNo} and rownum=1")
	public int delete(int rbNo);
	
	public int RequestBoardUpdate(RequestBoard requestBoard);
}
