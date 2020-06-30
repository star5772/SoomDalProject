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
			Dalin dalin = Dalin.builder().fNo("3").dProfile("profile경로").dIntro("짧은 소개글").detailFName("drum").dEmail(i+"thg520@naver.com").dPassword("qwer!1234").dName(i+"winter")
					.dTel("01011112222").dArea("계산").dLevel(Level.NORMAL).rReviewCnt(0).build();
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
	//@Test
	public void requestInsert() {
		Request r = Request.builder()
				.jMno(1)
				.rField("climming")
				.rSubject("dsf")
				.rLessonPurpose("sdfds")
				.rYourLevel("sdf")
				.rItemExists("sdf")
				.rLessonType("sdf")
				.rWantDate(LocalDateTime.now())
				.rWantTime("sdf")
				.rAge("54")
				.rGender(true)
				.rDalinIsOk(true)
				.rWannable("sdf")
				.rWantArea("sdf")
				.rWriteDate(LocalDateTime.now())
				.dMno(1)
				.rbEnabled(true)
				.build();
		rDao.insertToRequest(r);
				
				
	}
	
	
}
