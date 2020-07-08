package com.icia.dal.service.rest;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.Exception.*;
import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class RequestBoardRestService {
	@Inject
	private RequestBoardDao reqDao;
	@Transactional
	public void report(int rbNo, String username, String reason) {
		// 신고하려는 게시글없으면 예외처리
		if(reqDao.findByRequestBoard(rbNo)==null)
			throw new JobFailException("해당 글이 없습니다");
		// 중복으로 신고하면 예외처리
		if(reqDao.findReportUser(rbNo,username)==true)
			throw new JobFailException("같은사람을 여러 번 신고할 수 없습니다");
		// 신고 테이블에 추가
		reqDao.insertReport(rbNo,username,reason);
		// 신고 회수 증가 and 신고 여부 true 업데이트
		reqDao.RequestBoardUpdate(RequestBoard.builder().rbNo(rbNo).rbReportCnt(1).rbIsReport(true).build());
	}
	
	public void deleteToReqBoard(int rbNo, String username) {
		RequestBoard req = reqDao.findByRequestBoard(rbNo);
		if(req.getRbWriter().equals(username)==false)
			throw new JobFailException("작성자만 삭제 가능합니다");
		reqDao.delete(rbNo);
	}
}
