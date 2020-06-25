package com.icia.dal.service;

import java.security.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class QnaBoardService {
	@Inject
	private QnaBoardDao qnaBoardDao;
	
	public int write(QnaBoard qnaBoard) {
		qnaBoardDao.insert(qnaBoard);
		return qnaBoard.getQNo();
	}
	
	public void delete(int qNo) {
		qnaBoardDao.delete(qNo);
	}
	
	public QnaBoard read(int qNo,String username) {
		return qnaBoardDao.findByQnaBoard(qNo);
	}
	
}
