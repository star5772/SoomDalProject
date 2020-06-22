package com.icia.dal.dao.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class QnaBoardDaoTest {
	@Inject
	private QnaBoardDao qnaDao;
	
	//@Test
	public void insert() {
		QnaBoard qna = QnaBoard.builder().qCode("123456").qTitle("제목").qContent("내용").qWriter("새고개").cNo(1).build();
		assertThat(qnaDao.insert(qna), is(1));
	}
	
	//@Test
	public void update() {
		QnaBoard qna = QnaBoard.builder().qCode("123456").qTitle("ㅁㄴㅇ").qContent("안녕").build();
		assertThat(qnaDao.QnaBoardUpdate(qna), is(1));
	}
	
	//@Test
	public void findAllByQCode() {
		System.out.println(qnaDao.findAllByQCode("123456"));
	}
	
	//@Test
	public void delete() {
		assertThat(qnaDao.delete(1), is(1));
	}
}