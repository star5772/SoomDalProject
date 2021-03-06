package com.icia.dal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.NowPayment;
import com.icia.dal.entity.NowRefund;
import com.icia.dal.entity.RequestPayment;

@Repository
public class PaymentDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int insertToPayment(RequestPayment rp) {
		return tpl.insert("paymentMapper.insertToPayment",rp);
	}
	
	public int deleteToPayment(String dEmail) {
		return tpl.delete("paymentMapper.deleteToPayment",dEmail);
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
	
	public int addCashToDalin(Dalin dalin) {
		return tpl.update("paymentMapper.addCashToDalin",dalin);
	}
	
	public int findByDalinCash(String dEmail) {
		return tpl.selectOne("paymentMapper.findByDalinCash",dEmail);
	}
	
	// 여기부터 결제현황 DAO
	public int countToNowPayment() {
		return tpl.selectOne("paymentMapper.countToNowPayment");
	}
	
	public int insertToNowPayment(NowPayment np) {
		return tpl.insert("paymentMapper.insertNowPayment",np);
	}
	
	public List<NowPayment> findByNowPaymentToAdmin(int startRowNum,int endRowNum) {
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("paymentMapper.findByNowPaymentToAdmin",map);
	}
	
	public List<NowPayment> findByNowPaymentToDalin(int startRowNum,int endRowNum,String dEmail) {
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("dEmail",dEmail);
		return tpl.selectList("paymentMapper.findByNowPaymentToDalin",map);
	}
	
	public int updatePaymentToDalin(NowPayment np) {
		return tpl.update("paymentMapper.updatePaymentToDalin",np);
	}
	
	public int deleteToNowPayment(String pCode) {
		return tpl.delete("paymentMapper.deleteToNowPayment",pCode);
	}
	
	public NowPayment findByNowpayment(String dEmail) {
		return tpl.selectOne("paymentMapper.findByNowpayment",dEmail);
	}
	
	public NowPayment findByNowpaymentToPcode(String pCode) {
		return tpl.selectOne("paymentMapper.findByNowpaymentToPCode",pCode);
	}
	
	public int findByPmoneyToPcode(String pCode) {
		return tpl.selectOne("paymentMapper.findByPmoneyToPcode",pCode);
	}
	
	public int insertToNowRefund(NowRefund nr) {
		return tpl.insert("paymentMapper.insertToNowRefund",nr);
	}

	public int updateToNowRefund(NowRefund nr) {
		return tpl.update("paymentMapper.updateToNowRefund",nr);
	}

	public int countToRefund(String dEmail) {
		return tpl.selectOne("paymentMapper.countToRefund",dEmail);
	}

	public List<NowRefund> findAllNowRefundListToDalin(int startRowNum, int endRowNum, String dEmail) {
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("dEmail",dEmail);
		return tpl.selectList("paymentMapper.findAllNowRefundListToDalin",map);
	}
}
