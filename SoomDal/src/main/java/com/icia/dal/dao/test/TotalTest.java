package com.icia.dal.dao.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;
import com.icia.dal.service.PaymentService;

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
	@Inject
	private PaymentService paymentService;
	
	//@Test
	public void DalDaoTest() {
		Dalin dl = Dalin.builder().dCash(100000).dMno(1).build();
		assertThat(dalDao.updateToDalin(dl),is(1));
	}
	//@Test
	public void payServiceTest() {
		paymentService.addCashToDalin("TjOVeC", "star5772@naver.com");
	}
	
	
}
