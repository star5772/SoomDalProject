package com.icia.dal.service;

import java.security.*;
import java.time.format.*;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.entity.*;

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
	
}
