package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.RequestPayment;

@Repository
public class PaymentDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToPayment(RequestPayment rp) {
		return tpl.insert("paymentMapper.insertToPayment",rp);
	}
	
	public int deleteToPayment(String pCode) {
		return tpl.delete("paymentMapper.deleteToPayment",pCode);
	}
	
	public RequestPayment findByPayment(String dEmail) {
		return tpl.selectOne("paymentMapper.findByPayment",dEmail);
	}
	
	public List<RequestPayment> findAllByPayment(int startRowNum,int endRowNum) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("paymentMapper.findAllByPayment",map);
	}
	
	public int paymentCount() {
		return tpl.selectOne("paymentMapper.countToPayment");
	}
	
	public String findPcode(String dEmail) {
		return tpl.selectOne("paymentMapper.findPaymentCode",dEmail);
	}
	public int findToCash(String pCode) {
		return tpl.selectOne("paymentMapper.findToCash",pCode);
	}
}
