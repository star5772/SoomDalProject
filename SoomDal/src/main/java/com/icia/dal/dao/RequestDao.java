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
	
	public List<Request> findAllRequest(int startRowNum,int endRowNum,int jMno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("jMno", jMno);
		return tpl.selectList("requestMapper.findAllByRequest",map);
	}
	
	public int deleteToRequest(int rNo) {
		return tpl.delete("requestMapper.deleteToRequest",rNo);
	}
	
	public Request findByRequest(int rNo) {
		return tpl.selectOne("requestMapper.findByRequest",rNo);
	}
	
}
