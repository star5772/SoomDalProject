package com.icia.dal.service.rest;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.icia.dal.dao.MemoDao;

@Service
public class MemoRestService {
	@Inject
	private MemoDao memoDao;
	

	
	public void disableByReceiver(int mno) {
		memoDao.disableByReceiver(mno);
	}
}
