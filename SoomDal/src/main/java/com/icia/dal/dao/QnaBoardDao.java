package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.*;

import com.icia.dal.entity.*;

@Repository
public interface QnaBoardDao {
	// 문의게시판 list
	public List<QnaBoard> findAll();
	
	// 문의게시판 글추가
	public int insert(QnaBoard qnaBoard);
	// 문의게시판 글 삭제
	@Delete("delete from QnaBoard where Q_NO=#{qNo} and rownum=1")
	public int delete(int qNo);
	
	@Select("select Q_NO qNo, Q_TITLE qTitle, Q_CONTENT qContent, Q_WRITER qWriter, Q_WRITE_DATE qWriteDate, C_NO cNo, Q_IS_SECRET qIsSecret, Q_IS_NOTICE qIsNotice from QnaBoard where Q_NO=#{qNo} and rownum=1")
	public QnaBoard findByQnaBoard(int qNo);
	
	
}
