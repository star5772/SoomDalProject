package com.icia.dal.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.ProfileAttachment;

@Repository
public class ProfileAttachmentDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToProfileAttachment(ProfileAttachment pa) {
		return tpl.insert("profileAttachmentMapper.insertToProfileAttachment",pa);
	}
	
	public int deleteToProfileAttachment(int pAttachmentNo) {
		return tpl.delete("profileAttachmentMapper.deleteToProfileAttachment",pAttachmentNo);
	}
	
	public ProfileAttachment findByProfileAttachment(int pAttachmentNo){
		return tpl.selectOne("profileAttachmentMapper.findByProfileAttachment",pAttachmentNo);
	}
	
	public List<ProfileAttachment> findAllByProfileAttachment(int dMno){
		return tpl.selectList("profileAttachmentMapper.findAllByProfileAttachment", dMno);
	}
}
