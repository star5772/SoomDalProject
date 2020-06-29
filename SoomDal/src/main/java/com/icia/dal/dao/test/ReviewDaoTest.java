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
public class ReviewDaoTest {
	@Inject
	private ReviewDao reviewDao;
	
	//@Test
	public void findAll() {
		//System.out.println(reviewDao.findAllByRno(1));
	}
	
	//@Test
	public void delete() {
		//assertThat(reviewDao.delete(1), is(1));
	}
	
	//@Test
	public void insertTest() {
		for(int i=0; i<100; i++) {
		Review review = Review.builder().rNo(1).rContent("냉무").rScore(1).rSajinCnt(1).rWriter("새고개").sNo(1).build();
		assertThat(reviewDao.insertToReview(review), is(1));
		}
	}
	
	//@Test
	public void updateTest() {
		for(int i=0; i<100; i++) {
			Review review = Review.builder().rNo(i+1).jAccusationCnt(1).build();
			reviewDao.updateToReview(review);
		}
	}
}
