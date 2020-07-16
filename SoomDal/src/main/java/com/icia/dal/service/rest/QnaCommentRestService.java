package com.icia.dal.service.rest;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.QnaBoardDao;
import com.icia.dal.dao.QnaCommentDao;
import com.icia.dal.entity.QnaComment;

@Service
public class QnaCommentRestService {
	@Inject
	private QnaBoardDao qnaBoardDao;
	@Inject
	private QnaCommentDao qnaCommentDao;
	@Transactional
	public void write(String cContent, Integer qNo) {
		if(qnaBoardDao.findByQnaBoard(qNo)==null)
			throw new JobFailException("게시글이 없습니다");
		QnaComment comment = QnaComment.builder().qNo(qNo).cContent(cContent).build();
		if(qnaCommentDao.insert(comment)==0) 
			throw new JobFailException("댓글 작성에 실패했습니다");
		int cNo = qnaCommentDao.findByCno(qNo).getCNo();
		qnaBoardDao.update(qNo,cNo);
	}
	@Transactional
	public void delete(int cNo, int qNo) {
		QnaComment comment = qnaCommentDao.findByCno(qNo);
		if(comment.getQNo()!=qNo)
			throw new JobFailException("댓글을 찾을 수 없습니다");
		qnaCommentDao.delete(cNo);
		qnaBoardDao.update(qNo,0);
	}

}
