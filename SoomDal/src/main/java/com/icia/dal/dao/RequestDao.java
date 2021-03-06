package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.Request;

@Repository
public class RequestDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToRequest(Request rq) {
		return tpl.insert("requestMapper.insertToRequest",rq);
	}
	
	public List<Request> findAllRequestToJeja(int startRowNum,int endRowNum,int jMno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("jMno", jMno);
		return tpl.selectList("requestMapper.findAllByRequestToJeja",map);
	}
	public List<Request> findAllRequestToDalin(int startRowNum,int endRowNum,int dMno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("dMno", dMno);
		return tpl.selectList("requestMapper.findAllByRequestToDalin",map);
	}

	
	
	public int deleteToRequest(int rNo) {
		return tpl.delete("requestMapper.deleteToRequest",rNo);
	}
	
	public Request findByRequest(int rNo) {
		return tpl.selectOne("requestMapper.findByRequest",rNo);
	}

	public int countToRequest(int jMno) {
		return tpl.selectOne("requestMapper.countToRequest",jMno);
	}

	public int countToRequestforDalin(int dMno) {
		return tpl.selectOne("requestMapper.countToRequestForDalin",dMno);
	}
	
	public int setIsOk(int rNo) {
		return tpl.update("requestMapper.setIsOk",rNo);
	}
	
	public Integer findRequestByJmno(int dMno) {
		return tpl.selectOne("requestMapper.findRequestByJmno",dMno);
	}
	
	public int setDisableByJeja(int rNo,int jMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		map.put("jMno", jMno);
		return tpl.update("requestMapper.setDisableByJeja",map);
	}
	
	public int setDisableByDalin(int rNo,int dMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		map.put("dMno", dMno);
		return tpl.update("requestMapper.setDisableByDalin",map);
	}

}
