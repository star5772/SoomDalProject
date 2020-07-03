package com.icia.dal.dao;

import org.apache.ibatis.annotations.*;

import com.icia.dal.entity.*;

public interface DetailFieldDao {
	@Select("select f_no fNo, detail_f_name detailFName, detail_f_sajin detailFSajin from detailField where detail_f_name=#{detailFName}")
	public DetailField findByDetailFName(String detailFName);
}
