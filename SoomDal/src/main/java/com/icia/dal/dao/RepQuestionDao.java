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
	
	public List<RepQuestion> findAllToRequestion(String dEmail) {
		return tpl.selectList("RepQuestionMapper.findAllToRequestion", dEmail);
	}
	
	public int insertToRequestion(RepQuestion repQuestion) {
		return tpl.insert("RepQuestionMapper.insertToRequestion", repQuestion);
	}
}
