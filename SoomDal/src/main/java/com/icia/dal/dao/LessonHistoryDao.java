package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.LessonHistory;

@Repository
public class LessonHistoryDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToLessonHistory(LessonHistory lh) {
		return tpl.insert("historyMapper.insertToLessonHistory",lh);
	}
	
	public List<LessonHistory> findAllByLessonHistoryToJeja(int startRowNum,int endRowNum,int jMno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("jMno", jMno);
		return tpl.selectList("historyMapper.findAllByLessonHistoryToJeja",map);
	}

	public List<LessonHistory> findAllByLessonHistoryToDalin(int startRowNum,int endRowNum,int dMno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("dMno", dMno);
		return tpl.selectList("historyMapper.findAllByLessonHistoryToDalin",map);
	}
	
	public String findByCompleteCodeToLH(int jMno,int dMno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jMno", jMno);
		map.put("dMno", dMno);
		return tpl.selectOne("historyMapper.findByCompleteCodeToLH",map);
	}
	
	public int setReviewIsOk(String aCompleteCode) {
		return tpl.update("historyMapper.setReviewIsOk",aCompleteCode);
	}
	
	public int deleteToLessonHistory(String aCompleteCode) {
		return tpl.delete("historyMapper.deleteToLessonHistory",aCompleteCode);
	}

	public int countOfLessonToJeja(int jMno) {
		return tpl.selectOne("historyMapper.countOfLessonToJeja",jMno);
	}
	
	public int countOfLessonToDalin(int dMno) {
		return tpl.selectOne("historyMapper.countOfLessonToDalin",dMno);
	}
}
