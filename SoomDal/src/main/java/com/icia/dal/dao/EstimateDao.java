package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.Estimate;

@Repository
public class EstimateDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	// 메모작성
	public int insertToEstimate(Estimate et) {
		return tpl.insert("estimateMapper.insertToEstimate",et);
	}
	// 메모읽기
	public Estimate findByEstimate(int eNo) {
		return tpl.selectOne("estimateMapper.findByEstimate",eNo);
	}
	// 달인(보낸견적서목록)
	public List<Estimate> findAllByEstimateToDalin(int startRowNum,int endRowNum,int dMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("dMno",dMno);
		return tpl.selectList("estimateMapper.findAllByEstimateToDalin",map);
	}
	// 제자(받은견적서목록)
	public List<Estimate> findAllByEstimateToJeja(int startRowNum,int endRowNum,int jMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("jMno",jMno);
		System.out.println("ddddddddddd");
		return tpl.selectList("estimateMapper.findAllByEstimateToJeja",map);
	}
	// 견적서 수락여부 업데이트
	public int setIsOk(int eNo) {
		return tpl.update("estimateMapper.setIsOk",eNo);
	}
	// 견적서 삭제
	public int deleteToEstimate(int eNo) {
		return tpl.delete("estimateMapper.deleteToEstimate",eNo);
	}
	// 달인 견적서 숫자 카운트
	public int countToEstimate(int dMno) {
		return tpl.selectOne("estimateMapper.countToEstimate",dMno);
	}
	// 제자 견적서 숫자 카운트
	public int countToEstimateForJeja(int jMno) {
		return tpl.selectOne("estimateMapper.countToEstimateForJeja",jMno);
	}
	// 제자가 받은 견적서중 읽지않은 견적서 카운팅을 위한 메소드
	public boolean isNotReadEstimate(int jMno) {
		return tpl.selectOne("estimateMapper.isNotReadEstimate",jMno);
	}
	// 제자가 받은 견적서를 읽음 으로 바꿈
	public int setRead(int eNo) {
		return tpl.selectOne("estimateMapper.setRead",eNo);
	}
	
	public int setDisableByJeja(int eNo,int jMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eNo", eNo);
		map.put("jMno", jMno);
		return tpl.update("estimateMapper.setDisableByJeja",map);
	}
	
	public int setDisableByDalin(int eNo,int dMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eNo", eNo);
		map.put("dMno", dMno);
		return tpl.update("estimateMapper.setDisableByDalin",map);
	}
}
