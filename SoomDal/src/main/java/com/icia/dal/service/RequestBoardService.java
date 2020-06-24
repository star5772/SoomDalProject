package com.icia.dal.service;

import java.time.format.*;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.entity.*;

@Service
public class RequestBoardService {
	@Inject
	private RequestBoardDao reqDao;
	@Inject
	private ModelMapper modelMapper;
	
	public RequestBoardDto.DtoForRead read(int rbNo, String rbWriter) {
		RequestBoard reqBoard = reqDao.findByRequestBoard(rbNo);
		System.out.println("---------------------------------------------------------------------------------------------------"+reqBoard);
		RequestBoardDto.DtoForRead dto = modelMapper.map(reqBoard, RequestBoardDto.DtoForRead.class);
		if(rbWriter!=null && rbWriter.equals(dto.getRbWriter())==false)
			reqDao.RequestBoardUpdate(RequestBoard.builder().rbNo(rbNo).rbReadCnt(0).build());
		String str = reqBoard.getRbWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setRbWriteDateStr(str);
		return dto;
	}
}
