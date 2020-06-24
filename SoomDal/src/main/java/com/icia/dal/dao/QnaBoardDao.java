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
<<<<<<< HEAD
	@Insert("insert into QnaBoard values(#{q.qNo}, #{q.qTitle}, #{q.qContent}, sysdate, #{q.qWriter}, #{q.cNo}, 0,0)")
	public int insert(@Param("q")QnaBoard qnaBoard);
=======
	public int insert(QnaBoard qnaBoard);
>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
	
	// 문의게시판 글 삭제
	@Delete("delete from QnaBoard where Q_NO=#{qNo} and rownum=1")
	public int delete(int qNo);
	
	@Select("select Q_NO qNo, Q_TITLE qTitle, Q_CONTENT qContent, Q_WRITER qWriter, Q_WRITE_DATE qWriteDate, C_NO cNo, Q_IS_SECRET qIsSecret, Q_IS_NOTICE qIsNotice from QnaBoard where Q_NO=#{qNo}")
	public QnaBoard findByQnaBoard(int qNo);
	
	
}
