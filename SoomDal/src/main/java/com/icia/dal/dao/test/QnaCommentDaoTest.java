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
public class QnaCommentDaoTest {
	@Inject
	private QnaCommentDao qnacDao;
	
	@Test
	private void insert() {
		QnaComment qna = QnaComment.builder().cNo(1).cCode("asdasd").cContent("내용").adEmail("aa@aaa.com").build();
		assertThat(qnacDao.insert(qna), is(1));
	}
}
