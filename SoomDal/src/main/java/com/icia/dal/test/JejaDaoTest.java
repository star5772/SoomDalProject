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
import com.icia.dal.service.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class JejaDaoTest {
	@Inject
	private JejaDao jejaDao;
	
	
	//@Test
	public void jejaInsertTest() {
		for(int i=0; i<100; i++) {
			Jeja jeja = Jeja.builder().jMno(1).jEmail("aa@aaa.com").jPassword("1234").jName("새고개").jTel("01011112222").build();
			assertThat(jejaDao.insertJeja(jeja), is(1));
		}
	}
	
	//@Test
	public void jejaUpdateTest() {
		for(int i=0; i<100; i++) {
			Jeja jeja = Jeja.builder().jEmail("aa@aaa.com").jPassword("1234").jName("새고개").jTel("01022221111").jAccusationCnt(1).build();
			assertThat(jejaDao.updateJeja(jeja), is(1));
		}
	}
	
	
}
