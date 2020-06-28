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
	
	public List<LessonHistory> findAllByLessonHistory(int startRowNum,int endRowNum,String aCompleteCode) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("aCompleteCode", aCompleteCode);
		return tpl.selectList("historyMapper.findAllByLessonHistory",map);
	}
	
	public int deleteToLessonHistory(String aCompleteCode) {
		return tpl.delete("historyMapper.deleteToLessonHistory",aCompleteCode);
	}
}
