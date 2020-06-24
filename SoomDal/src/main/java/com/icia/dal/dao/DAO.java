package com.icia.dal.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface DAO {
	
	@Insert("insert into authorities values(#{username},#{authority})")
	public void insertAuthority(@Param("username")String username,@Param("authority")String authority);
}
