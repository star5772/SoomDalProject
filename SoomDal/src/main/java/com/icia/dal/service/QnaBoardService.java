package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.dao.QnaBoardDao;
import com.icia.dal.dto.PageToQnaBoard;
import com.icia.dal.dto.QnaDto;
import com.icia.dal.entity.QnaBoard;
import com.icia.dal.util.QnaBoardPagingUtil;

@Service
public class QnaBoardService {
	@Inject
	private QnaBoardDao qnaBoardDao;
	@Inject
	private ModelMapper modelMapper;
	
	public int write(QnaBoard qnaBoard,String username) {
		qnaBoard.setQWriter(username);
		qnaBoardDao.insert(qnaBoard);
		return qnaBoard.getQNo();
	}
	
	public void delete(int qNo) {
		qnaBoardDao.delete(qNo);
	}
	
	
	public QnaDto.DtoForQnaRead read(int qNo){
		QnaBoard qnaBoard = qnaBoardDao.findByQnaBoard(qNo);
		QnaDto.DtoForQnaRead dto = modelMapper.map(qnaBoard, QnaDto.DtoForQnaRead.class);
		String str = qnaBoard.getQWriteDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		dto.setWriteDateStr(str).setCno(qnaBoard.getCNo()).setTitle(qnaBoard.getQTitle()).setContent(qnaBoard.getQContent()).setWriter(qnaBoard.getQWriter()).setQno(qnaBoard.getQNo()).setSecret(qnaBoard.isQIsSecret());
		return dto;
	}

	public PageToQnaBoard list(int pageno, String qWriter) {
		int counOfQnaBoard = qnaBoardDao.count(qWriter);
		PageToQnaBoard page = QnaBoardPagingUtil.getPage(pageno, counOfQnaBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		
		List<QnaBoard> qnaBoardList = null;
		if(qWriter!=null)
			qnaBoardList = qnaBoardDao.findAllByWriter(srn, ern, qWriter);
		else
			qnaBoardList = qnaBoardDao.findAll(srn,ern);
		
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
