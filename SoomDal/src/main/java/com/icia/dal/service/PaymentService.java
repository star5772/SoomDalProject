package com.icia.dal.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.dao.PaymentDao;
import com.icia.dal.dao.UseCashDao;
import com.icia.dal.dto.NowPaymentDto;
import com.icia.dal.dto.UseCashDto;
import com.icia.dal.dto.page.PageToNowPayment;
import com.icia.dal.dto.page.PageToUseCash;
import com.icia.dal.entity.NowPayment;
import com.icia.dal.entity.UseCash;
import com.icia.dal.util.pagingutil.PaymentPagingUtil;
import com.icia.dal.util.pagingutil.UseCashPagingUtil;

@Service
public class PaymentService {
	@Inject
	private PaymentDao paymentDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private UseCashDao ucDao;

	public int readToDalinCash(String dEmail) {
		return paymentDao.findByDalinCash(dEmail);
	}
	
	// 관리자 캐쉬충전내역 페이징	(미사용)
	public PageToNowPayment reqPayment(int pageno) {
		int countOfBoard = paymentDao.countToNowPayment();
		PageToNowPayment page = PaymentPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<NowPayment> npList = null;
		npList = paymentDao.findByNowPaymentToAdmin(srn, ern);
		
		List<NowPaymentDto.DtoForListToNowPayment> list = new ArrayList<>();
		for(NowPayment np:npList) {
			NowPaymentDto.DtoForListToNowPayment dto = modelMapper.map(np, NowPaymentDto.DtoForListToNowPayment.class);
			String str = np.getPDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일 hh시 mm분"));
			dto.setPDateStr(str);
			list.add(dto);
		}
		page.setList(list);
		return page;
	}
	
	// 달인 캐쉬충전내역 페이징
	public PageToNowPayment reqPaymentToDalin(int pageno,String username) {
		int countOfBoard = paymentDao.countToNowPayment();
		PageToNowPayment page = PaymentPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<NowPayment> npList = null;
		npList = paymentDao.findByNowPaymentToDalin(srn, ern,username);
		
		List<NowPaymentDto.DtoForListToNowPayment> list = new ArrayList<>();
		for(NowPayment np:npList) {
			NowPaymentDto.DtoForListToNowPayment dto = modelMapper.map(np, NowPaymentDto.DtoForListToNowPayment.class);
			String str = np.getPDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일 hh시 mm분"));
			dto.setPDateStr(str);
			list.add(dto);
		}
		page.setList(list);
		return page;
	}
	
	public PageToUseCash useCashList(int pageno,String username,int dMno) {
		int countOfUseCash = ucDao.countToUseCash(dMno);
		PageToUseCash page = UseCashPagingUtil.getPage(pageno, countOfUseCash);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<UseCash> ucList = null;
		ucList = ucDao.findAllByUseCash(srn, ern, dMno);
		List<UseCashDto.DtoForList> list = new ArrayList<>();
		for(UseCash uc:ucList) {
			UseCashDto.DtoForList dto = modelMapper.map(uc, UseCashDto.DtoForList.class);
			String str = uc.getCaUseDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH시 mm분"));
			dto.setCaUseDateStr(str);
			list.add(dto);
		}
		page.setList(list);
		return page;
	}
}
