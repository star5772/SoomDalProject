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
	
	
	@Test
	public void insert() {
		for(int i=0; i<86; i++) {
			RequestBoard req = RequestBoard.builder().rbTitle(i+"번째 글").rbContent("냉무").rbWriter("spring").rbReadCnt(0).rbReportCnt(0).rbIsBlock(false).rbIsNotice(false).rNo(0).jMno(0).build();
			requestDao.insert(req);
		}
	}
	
	//@Test
	public void findAllByRbno() {
		System.out.println(requestDao.findAllByRbno(1));
	}
	
	//@Test
	public void update() {
		RequestBoard req = RequestBoard.builder().rbNo(1).rbTitle("sadf").rbContent("sdf").rbReadCnt(0).rbReportCnt(0).build();
		assertThat(requestDao.RequestBoardUpdate(req), is(1));
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
