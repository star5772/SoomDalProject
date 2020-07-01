package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.Memo;

@Repository
public class MemoDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insert(Memo memo) {
		return tpl.insert("memoMapper.insert", memo);
	}

	public List<Memo> findAllByMemo(int startRowNum, int endRowNum, String receiver) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("receiver", receiver);
		return tpl.selectList("memoMapper.findAllByReceiver", map);
	}

	public Memo findById(Integer mno) {
		return tpl.selectOne("memoMapper.findById", mno);
	}

	public Memo findByMemo(Integer mno) {
		return tpl.selectOne("memoMapper.findByMemo",mno);
	}
	public int setRead(Integer mno) {
		return tpl.update("memoMapper.setRead", mno);
	}

	public int disableBySender(List<Integer> list) {
		return tpl.update("memoMapper.disableBySender", list);
	}

	public int disableByReceiver(List<Integer> list) {
		return tpl.update("memoMapper.disableByReceiver", list);
	}

	public int delete() {
		return tpl.delete("memoMapper.delete");
	}

	public boolean isNotReadMemoExist(String username) {
		return tpl.selectOne("memoMapper.isNotReadMemoExist", username);
	}
	
	public int countToMemo(String username) {
		return tpl.selectOne("memoMapper.countToMemo",username);
	}

	
}
