package com.icia.dal.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.RequestBoard;

@Repository
public class AdminDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	// 제자회원 목록 출력
	public List<Jeja> findAllToJeja() {
		return tpl.selectList("adminMapper.findAllToJeja");
	}
	
	// 달인회원 목록 출력
	public List<Dalin> findAllToDalin() {
		return tpl.selectList("adminMapper.findAllToDalin");
	}
	
	// 신고회원 목록 출력
	public List<Map> findAllJejaReported(int jMno){
		return tpl.selectList("adminMapper.findAllJejaReported", jMno);
	}
	
	// 회원 정지
	public int updateToEnabled(String jEmail) {
		return tpl.update("adminMapper.updateToEnabled",jEmail);
	}
	
	// 환불
	public int updateToRefund(String pRefundCode) {
		return tpl.update("adminMapper.updateToRefund",pRefundCode);
	}
	
	// 신고게시물 목록 출력
	public List<RequestBoard> findAllToReportedBoard(boolean rbEnabled) {
		return tpl.selectList("adminMapper.findAllToReportedBoard", rbEnabled);
	}
	
}
