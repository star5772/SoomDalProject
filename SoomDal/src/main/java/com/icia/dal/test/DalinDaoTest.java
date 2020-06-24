package com.icia.dal.test;

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
public class DalinDaoTest {
	@Inject
	private DalinDao dao;
	
	@Test
	public void insertToDalinTest() {
		Dalin dalin = Dalin.builder().fNo("k").dEmail("thgus2520@naver.com").dPassword("qwer!1234").dName("spring")
				.dTel("01011112222").dArea("인천").dLevel(Level.NORMAL).build();
		dao.insertToDalin(dalin);
	}
	
	//@Test
	public void findByDalinProfile() {
		assertThat(dao.findByDalinProfile(1), is(notNullValue()));
	}
	
	//@Test
	public void updateProfileTest() {
		Dalin dalin = Dalin.builder().dMno(1).dProfile("dlkdj").dName("홍길동").dIntro("안녕하수까").dArea("미추홀구").build();
		dao.updateToDalinProfile(dalin);
	}
	
	//@Test
	public void findByDalinTest() {
		assertThat(dao.findByDalin(1), is(notNullValue()));
	}
	
	//@Test
	public void updateDalinTest() {
		Dalin dalin = Dalin.builder().dMno(1).dName("전우치").dPassword("1234").dTel("01011111111").build();
		dao.updateToDalin(dalin);
	}
	
	//@Test
	public void deleteToDalinTest() {
		//dao.deleteToDalin(1);
	}
}
