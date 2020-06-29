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
	
//	@Test
	public void insertToQnaBoardTest() {
		for(int i=0; i<86; i++) {
			QnaBoard qna = QnaBoard.builder().qTitle("제목입니다").qContent("내용이다 내용").qWriter("이은지")
				.qWriteDate(LocalDateTime.now()).qIsSecret(false).qIsNotice(false).build();
			assertThat(qnaDao.insertToQnaBoard(qna),is(1));
		}
	}
	
}
 