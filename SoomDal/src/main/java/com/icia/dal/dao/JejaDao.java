package com.icia.dal.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.dal.entity.*;

@Repository
public class JejaDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public String findJNameAndJTelByJejaId(String jName, String jTel) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("jName", jName);
		map.put("jTel",jTel);
		return tpl.selectOne("jejaMapper.findJNameAndJTelByJejaId", map);
	}
	public int updateJeja(Jeja jeja) {
		return tpl.update("jejaMapper.updateJeja",jeja);
	}
	
	public int deleteJeja(String jEmail) {
		return tpl.delete("jejaMapper.deleteJeja",jEmail);
	}
	public String existsByjEmail(String jEmail) {
		return tpl.selectOne("jejaMapper.existsByjEmail",jEmail);
	}
	
	public int insertJeja(Jeja jeja) {
		return tpl.insert("jejaMapper.insertJeja",jeja);
	}
	
	public Jeja findById(String jEmail) {
		return tpl.selectOne("jejaMapper.findById",jEmail);
	}
	
	public Jeja findByJejaToJMno(int jMno) {
		return tpl.selectOne("jejaMapper.findByJejaToJMno",jMno);
	}
	
	public String findIdByName(String jName) {
		return tpl.selectOne("jejaMapper.findIdByName",jName);
	}
	

	
}
