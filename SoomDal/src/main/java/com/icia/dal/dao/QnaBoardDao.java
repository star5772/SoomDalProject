package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.icia.dal.entity.*;

public interface QnaBoardDao {
	// 문의게시판 글읽기
	@Select("select Q_CODE qCode, Q_TITLE qTitle, Q_CONTENT qContent, Q_WRITER qWriter, Q_WRITE_DATE qWriteDate, C_NO cNo, Q_IS_SECRET qIsSecret, Q_IS_NOTICE qIsNotice from QnaBoard where Q_CODE=#{qCode}")
	public List<QnaBoard> findAllByQCode(String qcode);
	
	// 문의게시판 글추가
	@Insert("insert into QnaBoard values(#{q.qCode}, #{q.qTitle}, #{q.qContent}, sysdate, #{q.qWriter}, #{q.cNo}, 0,0)")
	public int insert(@Param("q")QnaBoard qnaBoard);
	
	// 문의게시판 글삭제 댓글번호
	@Delete("delete from QnaBoard where C_NO=#{cNo} and rownum=1")
	public int delete(int cNo);
	
	// 문의게시판 수정
	public int QnaBoardUpdate(QnaBoard qnaBoard);
}
