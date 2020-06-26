package com.icia.dal.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.dal.entity.*;
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
	public List<Jeja> findAllToJeja(int startRowNum, int endRowNum) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllToJeja", map);
	}
	
	// 달인회원 목록 출력
	public List<Dalin> findAllToDalin(int startRowNum, int endRowNum) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllToDalin", map);
	}
	
	// 신고회원 목록 출력
	public List<Map> findAllJejaReported(int startRowNum, int endRowNum){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllJejaReported", map);
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
	public List<RequestBoard> findAllToReportedBoard(int startRowNum, int endRowNum) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllToReportedBoard", map);
	}
	
	public int countToJeja() {
		return tpl.selectOne("adminMapper.countToJeja");
	}
}
