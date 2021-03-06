package com.icia.dal.dao;

import java.util.*;

import javax.inject.*;


import com.icia.dal.entity.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	// 관리자 계정등록
	public int insertAdmin(Admin ad) {
		return tpl.insert("adminMapper.insertAdmin",ad);
	}
	
	
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
	
	public int countToDalin() {
		return tpl.selectOne("adminMapper.countToDalin");
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
	
	// 환불신청 페이징
	public List<NowRefund> findAllNowRefundList(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminMapper.findAllNowRefundList",map);
	}
	
	// 신고게시물 목록 출력
	public List<RequestBoard> findAllToReportedBoard(int startRowNum, int endRowNum) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllToReportedBoard", map);
	}
	
	public int countToRefund() {
		return tpl.selectOne("adminMapper.countToRefund");
	}
	
	public int countToJeja() {
		return tpl.selectOne("adminMapper.countToJeja");
	}
	
	public int countToReportedJeja() {
		return tpl.selectOne("adminMapper.countToReportedJeja");
	}
	
	public List<Jeja> findAllToRpList(int startRowNum, int endRowNum) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllToRpList", map);
	}
	
	public int countToReview() {
		return tpl.selectOne("adminMapper.countToReview");
	}
	
	public List<Jeja> findAllEnabledToJeja(int startRowNum, int endRowNum) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("adminMapper.findAllEnabledToJeja", map);
	}
	
	public int countToJejaEnabled() {
		return tpl.selectOne("adminMapper.countToJejaEnabled");
	}
	
	public List<DetailField> findAllDetailField(String fNo) {
		return tpl.selectList("adminMapper.findAllDetailField",fNo);
	}
	
	public DetailField findByDetailField(String fNo,String detailFName) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fNo", fNo);
		map.put("detailFName", detailFName);
		return tpl.selectOne("adminMapper.findByDetailField",map);
	}
	
	public List<Field> findAllField() {
		return tpl.selectList("adminMapper.findAllField");
	}
	
	public Field findByField(String fNo) {
		return tpl.selectOne("adminMapper.findByField",fNo);
	}
	
	// 세부분야 사진파일 DB에 저장
	public int insertToDetailFName(DetailField df) {
		return tpl.insert("adminMapper.insertToDetailFName",df);
	}
	
	// 대분야 사진파일 DB에 저장
	public int insertToField(Field field) {
		return tpl.insert("adminMapper.insertToField",field);
	}
	
	// 세부분야 삭제
	public int deleteToDetailField(String fNo,String detailFName) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fNo", fNo);
		map.put("detailFName", detailFName);
		return tpl.delete("adminMapper.deleteToDetailField",map);
	}
	// 대분야 삭제
	public int deleteToField(String fNo) {
		return tpl.delete("adminMapper.deleteToField",fNo);
	}
	
	public ReportedBoard readRpBoard(int rbNo) {
		return tpl.selectOne("adminMapper.readRpBoard",rbNo);
	}
	
	public int deleteRpBoard(int rbNo) {
		return tpl.delete("adminMapper.deleteRpBoard",rbNo);
	}
	//public String findByPReqRefundDate() {
		//return tpl.selectOne("adminMapper.findByPReqRefundDate");
	//}

}
