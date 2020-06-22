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
	
	public int insertToJeja(Jeja jeja) {
		return tpl.insert("jejaMapper.insertToJeja",jeja);
	}
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
	
}