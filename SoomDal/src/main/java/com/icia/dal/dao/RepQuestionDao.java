package com.icia.dal.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.dal.entity.*;

@Repository
public class RepQuestionDao {
	@Inject
	private SqlSessionTemplate tpl;

	public RepQuestion findByDemail(String dEmail) {
		return tpl.selectOne("RepQuestionMapper.findByDemail",dEmail);
	}

	public int update(RepQuestion repQ) {
		return tpl.update("RepQuestionMapper.update",repQ);
	}

	public int insert(RepQuestion repQ) {
		return tpl.insert("RepQuestionMapper.insert",repQ);
	}

}
