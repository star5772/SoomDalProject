package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.QnaBoardDao;
import com.icia.dal.dao.QnaCommentDao;
import com.icia.dal.dto.QnaDto;
import com.icia.dal.dto.page.PageToQnaBoard;
import com.icia.dal.entity.QnaBoard;
import com.icia.dal.util.pagingutil.QnaBoardPagingUtil;

@Service
public class QnaBoardService {
	@Inject
	private QnaBoardDao qnaBoardDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private DalinDao dalinDao;
	@Inject
	private JejaDao jejaDao;
	@Inject
	private QnaCommentDao qnaCommentDao;
	
	public int write(QnaBoard qnaBoard,String username) {
		qnaBoard.setQWriter(username);
		
		if(jejaDao.findById(username)!=null) 
			qnaBoard.setQName(jejaDao.findById(username).getJName());
		else 
			qnaBoard.setQName(dalinDao.findByDalin(username).getDName());
		
		if(qnaBoard.getQIsSecret()==null)
			qnaBoard.setQIsSecret(false);
		qnaBoardDao.insertToQnaBoard(qnaBoard);
		return qnaBoard.getQNo();
	}
	
	public int delete(int qNo) {
		return qnaBoardDao.deleteToQnaBoard(qNo);
	}
	
	
	public QnaDto.DtoForQnaRead read(int qNo){
		QnaBoard qnaBoard = qnaBoardDao.findByQnaBoard(qNo);
		QnaDto.DtoForQnaRead dto = modelMapper.map(qnaBoard, QnaDto.DtoForQnaRead.class);
		String str = qnaBoard.getQWriteDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		dto.setWriteDateStr(str).setCno(qnaBoard.getCNo()).setComment(qnaCommentDao.findByCno(qNo)).setTitle(qnaBoard.getQTitle()).setName(qnaBoard.getQName()).setContent(qnaBoard.getQContent()).setWriter(qnaBoard.getQWriter()).setQNo(qnaBoard.getQNo()).setSecret(qnaBoard.getQIsSecret());
		return dto;
	}

	public PageToQnaBoard list(int pageno, String qName) {
		int counOfQnaBoard = qName!=null?qnaBoardDao.countByName(qName):qnaBoardDao.count();
		PageToQnaBoard page = QnaBoardPagingUtil.getPage(pageno, counOfQnaBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<QnaBoard> qnaBoardList = null;
		if(qName!=null) {
			qnaBoardList = qnaBoardDao.findAllByWriter(srn, ern, qName);
		}
		else {
			qnaBoardList = qnaBoardDao.findAllByQnaBoard(srn,ern);
		}
		List<QnaDto.DtoForQnaList> qnaList = new ArrayList<QnaDto.DtoForQnaList>();
		for(QnaBoard qnaBoard:qnaBoardList) {
			QnaDto.DtoForQnaList dto = modelMapper.map(qnaBoard, QnaDto.DtoForQnaList.class);
			dto.setQWriteDateStr(qnaBoard.getQWriteDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			qnaList.add(dto);
		}
		page.setList(qnaList);
		return page;
	
	}
	
	
}
