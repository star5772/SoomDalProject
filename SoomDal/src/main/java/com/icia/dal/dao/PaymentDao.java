package com.icia.dal.dao;

import java.util.List;

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
	
	public RequestPayment findByPayment(String pCode) {
		return tpl.selectOne("paymentMapper.findByPayment",pCode);
	}
	
	public List<RequestPayment> findAllByPayment() {
		return tpl.selectList("paymentMapper.findAllByPayment");
	}
}
