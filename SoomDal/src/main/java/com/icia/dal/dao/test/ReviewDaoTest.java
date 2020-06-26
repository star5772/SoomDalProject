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
	
	///@Test
	public void insert() {
		Review rev = Review.builder().rNo(2).rContent("내용").rWriter("작성").sNo(2).build();
		assertThat(reviewDao.insert(rev), is(2));
	}
	
	//@Test
	public void findAll() {
		System.out.println(reviewDao.findAllByRno(1));
	}
	
	//@Test
	public void delete() {
		assertThat(reviewDao.delete(1), is(1));
	}
}
