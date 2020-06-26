package com.icia.dal.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.*;

import com.icia.dal.entity.*;

@Repository
public interface QnaBoardDao {
	// 문의게시판 list
	public List<QnaBoard> findAllByQnaBoard(@Param("startRowNum") int startRowNum,@Param("endRowNum")int endRowNum);
	
	// 문의게시판 글추가
	public int insert(QnaBoard qnaBoard);
	// 문의게시판 글 삭제
	public int deleteToQnaBoard(int qNo);
	
	public QnaBoard findByQnaBoard(int qNo);

	public List<QnaBoard> findAllByWriter(@Param("srn") int srn,@Param("ern") int ern, String qWriter);

	public int count(String qWriter);
	
	
}
