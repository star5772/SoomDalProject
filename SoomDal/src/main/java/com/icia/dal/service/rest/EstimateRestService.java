package com.icia.dal.service.rest;

import javax.inject.*;

import org.apache.commons.lang3.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;
import com.icia.dal.util.websocket.*;

@Service
public class EstimateRestService {
	@Inject
	private JejaDao jejaDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private EstimateDao estimateDao;
	@Inject
	private ReviewAuthorityDao reviewAuthorityDao;
	@Inject
	private LessonHistoryDao lhDao;
	@Inject
	private UseCashDao ucDao;
	@Inject
	private MessageWebSocketHandler handler;
	
		// 제자회원이 견적서 수락시 동작
		@Transactional
		public void acceptToEstimate(int eNo,int dMno,int jMno) {
			Jeja jeja = jejaDao.findByJejaToJMno(jMno);
			// 견적서에 수락여부 "수락함" 으로 변경
			estimateDao.setIsOk(eNo);
			// 리뷰 작성권한부여하기위해 테이블에 insert 해야함 
			// -> 레슨완료코드 (랜덤8자) 생성
			String completeCode = RandomStringUtils.randomAlphanumeric(8);
			// -> 견적서번호 ,해당 견적서보낸 달인번호,해당 견적 요청한 제자번호 입력
			ReviewAuthority ra = ReviewAuthority.builder().aCompleteCode(completeCode).dMno(dMno).jMno(jMno).jEmail(jeja.getJEmail()).build();
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
			handler.sendJejaMessage(jeja.getJName(),dal.getDName(),jeja.getJName() + "님이 견적서를 수락하였습니다");
		}

		public int setDisableByJejaToEstimate(int eNo, int jMno) {
			return estimateDao.setDisableByJeja(eNo,jMno);
		}

		public int setDisableByDalinToEstimate(int eNo, int dMno) {
			return estimateDao.setDisableByDalin(eNo,dMno);
		}

		public int refuseEstimate(int eNo, int dMno, String name) {
			Jeja jeja = jejaDao.findById(name);
			Dalin dal = dalDao.findByDalinToDMno(dMno);
			handler.sendJejaMessage(jeja.getJName(),dal.getDName(), "요청서가 거절되었습니다");
			return estimateDao.setDisableByJeja(eNo, jeja.getJMno());
		}
}
