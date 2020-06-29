package com.icia.dal.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.dal.entity.*;

@Repository
public class DalinDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToDalin(Dalin dalin) {
		return tpl.insert("dalinMapper.insertToDalin", dalin);
	}
	
	public Dalin findByDalinProfile(Integer dMno) {
		return tpl.selectOne("dalinMapper.findByDalinProfile", dMno);
	}
	
	public Dalin findByDalin(String dEmail) {
		return tpl.selectOne("dalinMapper.findByDalin", dEmail);
	}
	
	public int updateToDalinProfile(Dalin dalin) {
		return tpl.update("dalinMapper.updateToDalinProfile", dalin);
	}
	
	public int updateToDalin(Dalin dalin) {
		return tpl.update("dalinMapper.updateToDalin", dalin);
	}
	
	public int deleteToDalin(String dEmail) {
		return tpl.delete("dalinMapper.deleteToDalin", dEmail);
	}

	public boolean existsById(String dEmail) {
		return tpl.selectOne("dalinMapper.existsByEmail", dEmail);
	}
	
	public int minusCash(int dCash) {
		return tpl.update("dalinMapper.minusCash",dCash);
	}

	public int countOfFieldDalin(String detailFName) {
		return tpl.selectOne("dalinMapper.countOfFieldDalin",detailFName);
	}

	public List<Dalin> findDalinByDetailFName(int startRowNum, int endRowNum, String detailFName) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("detailFName", detailFName);
		return tpl.selectList("dalinMapper.findDalinByDetailFName",map);
	}
	
	public String findJNameAndJTelByDalinId(String dName,String dTel) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("dName", dName);
		map.put("dTel", dTel);
		return tpl.selectOne("dalinMapper.findJNameAndJTelByDalinId",map);
	}
	
	public Dalin findByDalinToDMno(int dMno){
		return tpl.selectOne("dalinMapper.findByDalinToDMno",dMno);
	}

}
