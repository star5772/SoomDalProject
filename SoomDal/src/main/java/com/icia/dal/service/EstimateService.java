package com.icia.dal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.ReadFailException;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.EstimateDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.MemoDao;
import com.icia.dal.dao.RequestBoardDao;
import com.icia.dal.dao.RequestDao;
import com.icia.dal.dto.EstimateDto;
import com.icia.dal.dto.page.PageToEstimate;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Estimate;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.Memo;
import com.icia.dal.entity.Request;
import com.icia.dal.entity.RequestBoard;
import com.icia.dal.util.pagingutil.EstimatePagingUtil;
import com.icia.dal.util.websocket.MessageWebSocketHandler;

@Service
public class EstimateService {
	
	@Inject
	private EstimateDao estimateDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private MessageWebSocketHandler handler;
	@Inject
	private JejaDao jejaDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private RequestDao requestDao;
	@Inject
	private MemoDao memoDao;
	@Inject
	private RequestBoardDao rbDao;
	
	
	// 견적서작성
	@Transactional
	public void writeToEstimate(Estimate et, String username) {
		Dalin dalin = dalDao.findByDalin(username);
		requestDao.setIsOk(et.getRNo());
		Request request = requestDao.findByRequest(et.getRNo());
		RequestBoard reqboard = rbDao.findByRequestBoardToRNO(et.getRNo());
		if(request==null) 
			et.setJMno(reqboard.getJMno());
		else
			et.setJMno(request.getJMno());
		et.setDEmail(username);
		et.setDMno(dalin.getDMno());
		et.setFNo(dalin.getFNo());
		estimateDao.insertToEstimate(et);
		Jeja jeja = jejaDao.findByJejaToJMno(et.getJMno());
		Memo memo = Memo.builder().receiver(jeja.getJEmail()).title(dalin.getDName() + "님으로부터 견적서가 도착했습니다").content(LocalDateTime.now().format(DateTimeFormatter.ofPattern("MM월dd일 HH시mm분")) + "에 견적서가 도착했습니다. 견적서를 확인해주세요").sender(et.getDEmail()).build();
		memoDao.insert(memo);
		handler.sendDalinMessage(dalin.getDName(), jeja.getJName(),dalin.getDName() + "님으로부터 견적서가 도착하였습니다");
	}
	
	// 보낸 견적서 목록 페이징
	public PageToEstimate sendEstimateList(int pageno, int dMno) {
		int countOfEstimate = estimateDao.countToEstimate(dMno);
		PageToEstimate page = EstimatePagingUtil.getPage(pageno, countOfEstimate);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Estimate> etList = estimateDao.findAllByEstimateToDalin(srn,ern,dMno);
		List<EstimateDto.DtoForList> dtoList = new ArrayList<>();
		for(Estimate et:etList) {
			EstimateDto.DtoForList dto = modelMapper.map(et,EstimateDto.DtoForList.class);
			String str = et.getEWriteTime().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			
			Request request = requestDao.findByRequest(et.getRNo());
			RequestBoard reqboard = rbDao.findByRequestBoardToRNO(et.getRNo());
			Jeja jeja = jejaDao.findByJejaToJMno(et.getJMno());
			if(request==null)
				dto.setRSubject(reqboard.getFieldOrHobby());
			else if(request != null) {
				dto.setRSubject(request.getRSubject());
			}
			dto.setJName(jeja.getJName());
			dto.setEWriteTimeStr(str);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	// 견적서 읽기
	public EstimateDto.DtoForRead readToSendEstimate(@NotNull Integer eNo) throws ReadFailException {
		Estimate et = estimateDao.findByEstimate(eNo);	//여기
		Dalin dalin = dalDao.findByDalinToDMno(et.getDMno());
		Jeja jeja = jejaDao.findByJejaToJMno(et.getJMno());
		if(et==null)
			throw new ReadFailException();
		EstimateDto.DtoForRead dto = modelMapper.map(et,EstimateDto.DtoForRead.class);
		String str = et.getEWriteTime().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		Request request = requestDao.findByRequest(et.getRNo());
		RequestBoard reqboard = rbDao.findByRequestBoardToRNO(et.getRNo());
		if(request==null)
			dto.setRSubject(reqboard.getFieldOrHobby());
		else
			dto.setRSubject(request.getRSubject());
		dto.setDName(dalin.getDName());
		dto.setJName(jeja.getJName());
		dto.setEWriteTimeStr(str);
		dto.setDName(dalDao.findByDalinToDMno(et.getDMno()).getDName());
		
		return dto;
	}
	
	

	public PageToEstimate receiveEstimateList(int pageno, int jMno) {
		int countOfEstimate = estimateDao.countToEstimateForJeja(jMno);
		PageToEstimate page = EstimatePagingUtil.getPage(pageno, countOfEstimate);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Estimate> etList = estimateDao.findAllByEstimateToJeja(srn,ern,jMno);
		List<EstimateDto.DtoForList> dtoList = new ArrayList<>();
		for(Estimate et:etList) {
			EstimateDto.DtoForList dto = modelMapper.map(et,EstimateDto.DtoForList.class);
			String str = et.getEWriteTime().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			Request request = requestDao.findByRequest(et.getRNo());
			Dalin dalin = dalDao.findByDalinToDMno(et.getDMno());
			RequestBoard reqboard = rbDao.findByRequestBoardToRNO(et.getRNo());
			if(request==null)
				dto.setRSubject(reqboard.getFieldOrHobby());
			else
				dto.setRSubject(request.getRSubject());
			dto.setDName(dalin.getDName());
			dto.setEWriteTimeStr(str);
			dto.setDName(dalDao.findByDalinToDMno(et.getDMno()).getDName());
			
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	
}
