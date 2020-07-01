package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.icia.dal.entity.*;

public interface QnaCommentDao {
	// 문의 댓글 읽기
	@Select("select C_NO cNo, Q_NO qNo, C_CONTENT cContent, C_WRITE_DATE cWriteDate, AD_EMAIL adEmail from QnaComment where Q_NO=#{qno}")
	public QnaComment findByCno(int qNo);
	
	// 문의댓글 작성
	@Insert("insert into QnaComment values(#{c.cNo},#{c.cCode},#{c.cContent},sysdate,#{c.adEmail})")
	public int insert(@Param("c")QnaComment qnaComment); 
	
	// 문의댓글삭제
	@Delete("delete from QnaComment where C_NO=#{cNo}")
	public int delete(int cno);
	
}
