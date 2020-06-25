package com.icia.dal.dao;

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
		System.out.println(dalin.getDCash());
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
}
