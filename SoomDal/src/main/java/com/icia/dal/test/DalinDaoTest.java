package com.icia.dal.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.RequestDao;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Level;
import com.icia.dal.entity.Request;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class DalinDaoTest {
	@Inject
	private DalinDao dao;
	@Inject
	private RequestDao rDao;
	
	@Test
	public void insertToDalinTest() {
		for(int i=1; i<24;i++) {
			Dalin dalin = Dalin.builder().fNo("2").dProfile("http://localhost:8081/profile/winter.jpg").dIntro("짧은 소개글").detailFName("sandArt").dEmail(i+"thg520@naver.com").dPassword("qwer!1234").dName(i+"winter")
					.dTel("01011112222").dArea("미추홀").dLevel(Level.NORMAL).build();
			dao.insertToDalin(dalin);
		}
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
	public void updateDalinTest() {
		Dalin dalin = Dalin.builder().dMno(1).dName("전우치").dPassword("1234").dTel("01011111111").build();
		dao.updateToDalin(dalin);
	}
	
	
}
