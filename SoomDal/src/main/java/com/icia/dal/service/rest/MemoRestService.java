package com.icia.dal.service.rest;



import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dal.dao.MemoDao;

@Service
public class MemoRestService {
	@Inject
	private MemoDao memoDao;
	

	@Transactional
	public void disableByReceiver(int mno) {
		memoDao.disableByReceiver(mno);
	}
}
