package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.icia.dal.Exception.MemoNotFoundException;
import com.icia.dal.dao.MemoDao;
import com.icia.dal.dto.MemoDto;
import com.icia.dal.dto.page.PageToMemo;
import com.icia.dal.entity.Memo;
import com.icia.dal.util.pagingutil.MemoPagingUtil;
import com.icia.dal.util.websocket.MessageWebSocketHandler;

@Service
public class MemoService {
	@Inject
	private MemoDao memoDao;
	@Inject
	private MessageWebSocketHandler handler;
	@Inject
	private ModelMapper modelMapper;
	
	public void send(Memo memo) {
		memoDao.insert(memo);
		handler.sendMessage(memo.getSender(), memo.getReceiver(), memo.getTitle());
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
	
	// 쪽지목록 페이징
	public PageToMemo listToMemo(int pageno, String username) {
		int countOfMemo = memoDao.countToMemo(username);
		PageToMemo page = MemoPagingUtil.getPage(pageno, countOfMemo);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Memo> mmList = memoDao.findAllByMemo(srn, ern, username);
		List<MemoDto.DtoForMemoList> dtoList = new ArrayList<>();
		for(Memo mm:mmList) {
			MemoDto.DtoForMemoList dto = modelMapper.map(mm,MemoDto.DtoForMemoList.class);
			String str = mm.getWriteTime().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			dto.setWriteTimeStr(str);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
		
	}




	
}
