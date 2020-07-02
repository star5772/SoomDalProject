package com.icia.dal.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.QnaBoardDao;
import com.icia.dal.dao.QnaCommentDao;
import com.icia.dal.entity.QnaComment;

@Service
public class QnaCommentService {
	@Inject
	private QnaBoardDao qnaBoardDao;
	@Inject
	private QnaCommentDao qnaCommentDao;
	
	public void write(String cContent, int qNo) {
		if(qnaBoardDao.findByQnaBoard(qNo)==null)
			throw new JobFailException();
		QnaComment comment = QnaComment.builder().qNo(qNo).cContent(cContent).build();
		if(qnaCommentDao.insert(comment)==0)
			throw new JobFailException();
		int cNo = qnaCommentDao.findByCno(qNo).getCNo();
		qnaBoardDao.update(qNo,cNo);
	}
	
	public void delete(int cNo, int qNo) {
		QnaComment comment = qnaCommentDao.findByCno(qNo);
		if(comment.getQNo()!=qNo)
			throw new JobFailException();
		qnaCommentDao.delete(cNo);
		qnaBoardDao.update(qNo,0);
	}

}
