package com.icia.dal.dao;

import java.util.List;

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

	public List<Memo> findAllByMemo(String username) {
		return tpl.selectList("memoMapper.findAllByReceiver", username);
	}

	public Memo findById(Integer mno) {
		return tpl.selectOne("memoMapper.findById", mno);
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
}
