package com.icia.dal.service;

import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.page.PageToRequestBoard;
import com.icia.dal.entity.*;
import com.icia.dal.util.*;
import com.icia.dal.util.pagingutil.RequestBoardPagingUtil;

@Service
public class RequestBoardService {
	@Inject
	private RequestBoardDao reqDao;
	@Inject
	private ModelMapper modelMapper;
	
	public RequestBoardDto.DtoForRead read(int rbNo, String rbWriter) {
		RequestBoard reqBoard = reqDao.findByRequestBoard(rbNo);
		RequestBoardDto.DtoForRead dto = modelMapper.map(reqBoard, RequestBoardDto.DtoForRead.class);
		if(rbWriter!=null && rbWriter.equals(dto.getRbWriter())==false)
			reqDao.RequestBoardUpdate(RequestBoard.builder().rbNo(rbNo).rbReadCnt(0).build());
		String str = reqBoard.getRbWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setRbWriteDateStr(str);
		return dto;
	}
	
	public int write(RequestBoardDto.DtoForWrite dto) {
		RequestBoard reqBoard = modelMapper.map(dto, RequestBoard.class);
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
		else
			boardList = reqDao.findAllByRequestBoard(srn, ern);
		
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
