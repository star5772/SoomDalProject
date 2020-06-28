package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.UseCash;

@Repository
public class UseCashDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToUseCash(UseCash uc) {
		return tpl.insert("useCashMapper.insertToUseCash",uc);
	}
	
	public List<UseCash> findAllByUseCash(int startRowNum,int endRowNum,int dMno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("dMno", dMno);
		return tpl.selectList("useCashMapper.findAllByUseCash",map);
	}
	
	public int deleteToUseCash(int eNo) {
		return tpl.delete("useCashMapper.deleteByUseCash",eNo);
	}
}
