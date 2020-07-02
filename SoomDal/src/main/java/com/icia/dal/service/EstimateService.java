package com.icia.dal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.RandomStringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.ReadFailException;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.EstimateDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.LessonHistoryDao;
import com.icia.dal.dao.MemoDao;
import com.icia.dal.dao.RequestDao;
import com.icia.dal.dao.ReviewAuthorityDao;
import com.icia.dal.dao.UseCashDao;
import com.icia.dal.dto.EstimateDto;
import com.icia.dal.dto.page.PageToEstimate;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Estimate;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.LessonHistory;
import com.icia.dal.entity.Level;
import com.icia.dal.entity.Memo;
import com.icia.dal.entity.Request;
import com.icia.dal.entity.ReviewAuthority;
import com.icia.dal.entity.UseCash;
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
	private ReviewAuthorityDao reviewAuthorityDao;
	@Inject
	private LessonHistoryDao lhDao;
	@Inject
	private UseCashDao ucDao;
	@Inject
	private RequestDao requestDao;
	@Inject
	private MemoDao memoDao;
	
	
	// 견적서작성
	public void writeToEstimate(Estimate et, String username) {
		Dalin dalin = dalDao.findByDalin(username);
		requestDao.setIsOk(et.getRNo());
		Request rq = requestDao.findByRequest(et.getRNo());
		et.setDEmail(username);
		et.setDMno(dalin.getDMno());
		et.setFNo(dalin.getFNo());
		et.setJMno(rq.getJMno());
		estimateDao.insertToEstimate(et);
		Jeja jeja = jejaDao.findByJejaToJMno(et.getJMno());
		Memo memo = Memo.builder().receiver(jeja.getJEmail()).title(dalin.getDName() + "님으로부터 견적서가 도착했습니다").content(LocalDateTime.now() + "에 견적서가 도착했습니다. 견적서를 확인해주세요").sender(et.getDEmail()).build();
		memoDao.insert(memo);
		handler.sendMessage(dalin.getDName(), jeja.getJName(),dalin.getDName() + "님으로부터 견적서가 도착하였습니다");
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
			Jeja jeja = jejaDao.findByJejaToJMno(et.getJMno());
			dto.setJName(jeja.getJName());
			dto.setRSubject(request.getRSubject());
			dto.setEWriteTimeStr(str);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	// 견적서 읽기
	public EstimateDto.DtoForRead readToSendEstimate(@NotNull Integer eNo) throws ReadFailException {
		System.out.println("eno::::============"+eNo);
		Estimate et = estimateDao.findByEstimate(eNo);	//여기
		System.out.println("eno:::::::========================="+eNo);
		Dalin dalin = dalDao.findByDalinToDMno(et.getDMno());
		Jeja jeja = jejaDao.findByJejaToJMno(et.getJMno());
		if(et==null)
			throw new ReadFailException();
		EstimateDto.DtoForRead dto = modelMapper.map(et,EstimateDto.DtoForRead.class);
		String str = et.getEWriteTime().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		Request request = requestDao.findByRequest(et.getRNo());
		dto.setDName(dalin.getDName());
		dto.setJName(jeja.getJName());
		dto.setRSubject(request.getRSubject());
		dto.setEWriteTimeStr(str);
		dto.setDName(dalDao.findByDalinToDMno(et.getDMno()).getDName());
		
		return dto;
	}
	
	// 제자회원이 견적서 수락시 동작
	public void acceptToEstimate(int eNo,int dMno,int jMno) {
		Jeja jeja = jejaDao.findByJejaToJMno(jMno);
		// 견적서에 수락여부 "수락함" 으로 변경
		estimateDao.setIsOk(eNo);
		// 리뷰 작성권한부여하기위해 테이블에 insert 해야함 
		// -> 레슨완료코드 (랜덤8자) 생성
		String completeCode = RandomStringUtils.randomAlphanumeric(8);
		// -> 견적서번호 ,해당 견적서보낸 달인번호,해당 견적 요청한 제자번호 입력
		ReviewAuthority ra = ReviewAuthority.builder().aCompleteCode(completeCode).dMno(dMno).jMno(jMno).build();
		reviewAuthorityDao.insertReviewAuthority(ra);
		// -> 견적서 수락누르면 견적서 요금만큼 캐쉬차감해야함.
		// -> 견적서 요금 차감시키는 코드
		Estimate et = estimateDao.findByEstimate(eNo);
		Dalin dal = dalDao.findByDalin(et.getDEmail());
		// -> 달인회원 등급에따라 견적서 요금 할인율 적용
		int Normal = et.getECash();
		int Silver =  (int)(et.getECash()-et.getECash()/0.05);
		int Gold = (int) (et.getECash() - et.getECash()/0.1);
		int Platiunm = (int) (et.getECash() - et.getECash()/0.15);
		if(dal.getDLevel()==Level.NORMAL) {
			et.setECash(Normal);
		}else if(dal.getDLevel()==Level.SILVER) {
			et.setECash(Silver);
		}else if(dal.getDLevel()==Level.GOLD) {
			et.setECash(Gold);
		}else
			et.setECash(Platiunm);
		dalDao.minusCash(et.getECash(),dMno);
		// 레슨내역 추가
		LessonHistory lh = LessonHistory.builder().aCompleteCode(ra.getACompleteCode()).dMno(ra.getDMno()).jMno(ra.getJMno()).build();
		lhDao.insertToLessonHistory(lh);
		// 캐시사용내역 추가
		UseCash uc = UseCash.builder().caEstimateCash(et.getECash()).dMno(et.getDMno()).eNo(et.getENo()).build();
		ucDao.insertToUseCash(uc);
		handler.sendMessage(jeja.getJName(),dal.getDName(),jeja.getJName() + "님이 견적서를 수락하였습니다");
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
			dto.setDName(dalin.getDName());
			dto.setRSubject(request.getRSubject());
			dto.setEWriteTimeStr(str);
			dto.setDName(dalDao.findByDalinToDMno(et.getDMno()).getDName());
			
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	
}
