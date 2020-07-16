package com.icia.dal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.JejaNotFoundException;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.RequestBoardDao;
import com.icia.dal.dto.RequestBoardDto;
import com.icia.dal.dto.page.PageToRequestBoard;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.RequestBoard;
import com.icia.dal.util.pagingutil.RequestBoardPagingUtil;


@Service
public class RequestBoardService {
	@Inject
	private RequestBoardDao reqDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private JejaDao jejaDao;
	
	public RequestBoardDto.DtoForRead read(int rbNo, String rbWriter) {
		RequestBoard reqBoard = reqDao.findByRequestBoard(rbNo);
		RequestBoardDto.DtoForRead dto = modelMapper.map(reqBoard, RequestBoardDto.DtoForRead.class);
		if(rbWriter!=null && rbWriter.equals(dto.getRbWriter())==false)
			reqDao.RequestBoardUpdate(RequestBoard.builder().rbNo(rbNo).rbReadCnt(0).build());
		Jeja jeja = jejaDao.findById(dto.getRbWriter());
		dto.setJName(jeja.getJName());
		String str = reqBoard.getRbWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setRbWriteDateStr(str);
		return dto;
	}
	@Transactional
	public int write(RequestBoardDto.DtoForWrite dto) throws JejaNotFoundException {
		RequestBoard reqBoard = modelMapper.map(dto, RequestBoard.class);
		Jeja jeja = jejaDao.findById(dto.getRbWriter());
		if(jeja==null) {
			throw new JejaNotFoundException();
		}
		if(dto.getRbTitle().length()==0)
			reqBoard.setRbTitle(reqBoard.getRbWriter() + "님의 요청서");
		reqBoard.setJMno(jeja.getJMno());
		reqBoard.setRbWriteDate(LocalDateTime.now());
		reqDao.insert(reqBoard);
		return reqBoard.getRbNo();
	}
	
	public PageToRequestBoard list(int pageno, String rbWriter) {
		int countOfBoard = reqDao.RequestBoardToCount(rbWriter);
		PageToRequestBoard page = RequestBoardPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		
		List<RequestBoard> boardList = null;
		if(rbWriter!=null)
			boardList = reqDao.findAllByRbWriter(srn, ern, rbWriter);
		else {
			boardList = reqDao.findAllByRequestBoard(srn, ern);
		}
		List<RequestBoardDto.DtoForList> dtoList = new ArrayList<>();
		for(RequestBoard board:boardList) {
			RequestBoardDto.DtoForList dto = modelMapper.map(board, RequestBoardDto.DtoForList.class);
			dto.setRbWriteDateStr(board.getRbWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}

	
}
