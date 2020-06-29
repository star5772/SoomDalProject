package com.icia.dal.dao;

import org.apache.ibatis.annotations.*;

public interface DAO {
	
	@Insert("insert into authorities values(#{username},#{authority})")
	public void insertAuthority(@Param("username")String username,@Param("authority")String authority);
	
	@Delete("delete from authorities where username=#{username} and rownum=1")
	public void deleteAuthority(String username);
}
