package com.icia.dal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.MemoNotFoundException;
import com.icia.dal.dao.MemoDao;
import com.icia.dal.entity.Memo;
import com.icia.dal.util.websocket.MessageWebSocketHandler;

@Service
public class MemoService {
	@Inject
	private MemoDao memoDao;
	@Inject
	private MessageWebSocketHandler handler;
	
	public void send(Memo memo) {
		memoDao.insert(memo);
		handler.sendMessage(memo.getSender(), memo.getReceiver(), memo.getTitle());
	}

	public List<Memo> findAllByMemo(String username) {
		return memoDao.findAllByMemo(username);
	}

	public Memo findById(Integer mno) throws MemoNotFoundException {
		Memo memo = memoDao.findById(mno);
		if(memo==null)
			throw new MemoNotFoundException();
		memoDao.setRead(mno);
		return memo;
	}

	@Scheduled(cron="0 0 4 1/1 * ?")
	public void delete() {
		memoDao.delete();
	}	
}
