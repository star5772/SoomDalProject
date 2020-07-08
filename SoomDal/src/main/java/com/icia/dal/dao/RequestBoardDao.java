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
	
	@Update("update requestboard set rb_is_block = 1 where rb_no = #{rbNo} and rownum=1")
	public int setIsBlock(int rbNo);
	
	public RequestBoard findByRequestBoard(int rbNo);
	
	public int RequestBoardToCount(String rbWriter);
	
	public List<RequestBoard> findAllByRequestBoard(@Param("startRowNum") int startRowNum, @Param("endRowNum") int endRowNum);
	
	public List<RequestBoard> findAllByRbWriter(@Param("startRowNum") int startRowNum, @Param("endRowNum") int endRowNum, @Param("rbWriter") String rbWriter);
	
	// 중복으로 신고한 회원이지 확인
	@Select("select count(*) from reportedBoard where rb_No=#{rbNo} and username=#{username} and rownum=1")
	public boolean findReportUser(@Param("rbNo") int rbNo,@Param("username") String username);
	// reported 테이블에 추가
	@Insert("insert into reportedBoard values(#{rbNo},#{username},#{reason})")
	public void insertReport(@Param("rbNo") int rbNo,@Param("username") String username,@Param("reason") String reason);
	
}
