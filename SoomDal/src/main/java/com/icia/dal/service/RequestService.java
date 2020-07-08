package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.MemoDao;
import com.icia.dal.dao.RequestDao;
import com.icia.dal.dto.RequestDto;
import com.icia.dal.dto.page.PageToRequest;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.Memo;
import com.icia.dal.entity.Request;
import com.icia.dal.util.pagingutil.RequestPagingUtil;
import com.icia.dal.util.websocket.MessageWebSocketHandler;

@Service
public class RequestService {
	
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private MessageWebSocketHandler handler;
	@Inject
	private JejaDao jejaDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private RequestDao rqDao;
	@Inject
	private MemoDao memoDao;
	
	// 요청서작성
	@Transactional
	public void writeToRequest(Request rq,String username) throws DalinNotFoundException {
		Jeja jeja = jejaDao.findById(username);
		Dalin dalin = dalDao.findByDalinProfile(rq.getDMno());
		Dalin dal = dalDao.findByDalinToDMno(rq.getDMno());
		if(dal==null || dalin==null) {
			throw new DalinNotFoundException();
		}
		rq.setJMno(jeja.getJMno());
		rq.setRField(dalin.getFNo());
		rq.setRSubject(dal.getDetailFName());
		rqDao.insertToRequest(rq);
		memoDao.insert(Memo.builder().receiver(dalin.getDEmail()).title(jeja.getJName() + "님으로부터 요청서가 도착했습니다").content(rq.getRWriteDate() + "에 견적서가 도착했습니다. 견적서를 확인해주세요").sender(jeja.getJEmail()).build());
		handler.sendJejaMessage(jeja.getJName(), dalin.getDName(), jeja.getJName() + "님으로부터 요청서가 도착하였습니다");
	}
	
	// 보낸요청서출력 (제자)
	public PageToRequest sendRequestList(int pageno, int jMno) {
		int countOfRequest = rqDao.countToRequest(jMno);
		PageToRequest page = RequestPagingUtil.getPage(pageno, countOfRequest);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Request> rqList = rqDao.findAllRequestToJeja(srn,ern,jMno);
		List<RequestDto.DtoForList> dtoList = new ArrayList<>();
		for(Request rq:rqList) {
			RequestDto.DtoForList dto = modelMapper.map(rq,RequestDto.DtoForList.class);
			String str = rq.getRWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분"));
			dto.setRWriteDateStr(str);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	// 받은요청서 출력(달인)
	public PageToRequest receiveRequestList(int pageno,int dMno) {
		int countOfRequest = rqDao.countToRequestforDalin(dMno);
		PageToRequest page = RequestPagingUtil.getPage(pageno, countOfRequest);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Request> rqList = rqDao.findAllRequestToDalin(srn,ern,dMno);
		List<RequestDto.DtoForList> dtoList = new ArrayList<>();
		for(Request rq:rqList) {
			RequestDto.DtoForList dto = modelMapper.map(rq,RequestDto.DtoForList.class);
			String str = rq.getRWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			dto.setRWriteDateStr(str);
			dto.setJName(jejaDao.findByJejaToJMno(rq.getJMno()).getJName());
			
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	// 요청서 읽기
	public RequestDto.DtoForRead readRequest(@NotNull Integer rNo) throws ReadFailException {
		Request rq = rqDao.findByRequest(rNo);
		Jeja jeja = jejaDao.findByJejaToJMno(rq.getJMno());

		if(rq==null)
			throw new ReadFailException();
		RequestDto.DtoForRead dto = modelMapper.map(rq,RequestDto.DtoForRead.class);
		String writeDate = rq.getRWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		String strr = rq.getRWantDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		dto.setRWriteDateStr(writeDate);
		dto.setJName(jeja.getJName());
		dto.setRWantDateStr(strr);
		dto.setJEmail(jeja.getJEmail());

		return dto;
	}

	
		
}
	


