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
	
}
