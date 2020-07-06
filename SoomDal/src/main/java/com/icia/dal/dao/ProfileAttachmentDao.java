package com.icia.dal.dao;

import java.util.*;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.ProfileAttachment;

@Repository
public class ProfileAttachmentDao {
	@Inject
	private SqlSessionTemplate tpl;

	public int insert(ProfileAttachment pfam) {
		return tpl.insert("profileAttachmentMapper.insert",pfam);
	}

	public ProfileAttachment findByIdAndNum(String dEmail, int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dEmail", dEmail);
		map.put("num", num);
		return tpl.selectOne("profileAttachmentMapper.findByIdAndNum", map);
	}

	public int update(ProfileAttachment pfam) {
		return tpl.update("profileAttachmentMapper.update",pfam);
	}
	
}
