package com.icia.dal.dao.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.icia.dal.dao.AdminDao;
import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.QnaBoardDao;
import com.icia.dal.dao.QnaCommentDao;
import com.icia.dal.dao.RequestBoardDao;
import com.icia.dal.dao.ReviewDao;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Level;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class TotalTest {
	@Inject
	private AdminDao adDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private JejaDao jDao;
	@Inject
	private QnaBoardDao qbDao;
	@Inject
	private QnaCommentDao qcDao;
	@Inject
	private RequestBoardDao rbDao;
	@Inject
	private ReviewDao rDao;
	
	//@Test
	public void DalDaoTest() {
		Dalin dl = Dalin.builder().dCash(100000).dMno(1).build();
		assertThat(dalDao.updateToDalin(dl),is(1));
	}
	@Test
	public void DATest() {
		dalDao.findByDalin(1);
		Dalin dl = Dalin.builder().dLevel(Level.SILVER).dEmail("star5773@naver.com").build();
		dalDao.updateToDalin(dl);
	}

}
