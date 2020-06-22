package com.icia.dal.dao.test;

import javax.inject.Inject;

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
	
	public void adDaoTest() {
		
	}

}
