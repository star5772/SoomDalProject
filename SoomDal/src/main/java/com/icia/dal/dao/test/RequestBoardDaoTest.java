package com.icia.dal.dao.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class RequestBoardDaoTest {
	@Inject
	private RequestBoardDao requestDao;
	
	//@Test
	public void insert() {
		RequestBoard req = RequestBoard.builder().rbNo(1).rbTitle("제목").rbContent("내용").rbWriter("작성자").rNo(1).jMno(1).build();
		assertThat(requestDao.insert(req), is(1));
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
}
