package com.icia.dal.test;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class DalinDaoTest {
	@Inject
	private DalinDao dao;
	
	@Test
	public void insertToDalinTest() {
		Dalin dalin = Dalin.builder().dMno(1).fNo("tmvhcm").dEmail("thgus2520@naver.com").dPassword("qwer!1234").dName("spring")
				.dTel("01011112222").dArea("인천").dLevel(Level.NORMAL).build();
		dao.insertToDalin(dalin);
	}
}
