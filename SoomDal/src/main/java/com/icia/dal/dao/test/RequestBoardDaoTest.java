package com.icia.dal.dao.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.icia.dal.dao.AdminDao;
import com.icia.dal.dao.RequestBoardDao;
import com.icia.dal.entity.RequestBoard;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class RequestBoardDaoTest {
	@Inject
	private RequestBoardDao requestDao;
	
	@Inject
	private AdminDao adDao;
	//@Test
	public void asdasTe() {
		assertThat(adDao.findByField("sport").getFName(),is("ㅇㅇㅇ"));
	}
	
	

	//@Test
	public void delete() {
		assertThat(requestDao.delete(1), is(1));
	}
	
	//@Test
	public void findById() {
		System.out.println(requestDao.findByRequestBoard(1));
	}
}
