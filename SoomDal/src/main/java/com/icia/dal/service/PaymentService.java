package com.icia.dal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.RandomStringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.PaymentDao;
import com.icia.dal.dao.UseCashDao;
import com.icia.dal.dto.NowPaymentDto;
import com.icia.dal.dto.UseCashDto;
import com.icia.dal.dto.page.PageToNowPayment;
import com.icia.dal.dto.page.PageToUseCash;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.NowPayment;
import com.icia.dal.entity.RequestPayment;
import com.icia.dal.entity.UseCash;
import com.icia.dal.util.pagingutil.PaymentPagingUtil;
import com.icia.dal.util.pagingutil.UseCashPagingUtil;

@Service
public class PaymentService {
	@Inject
	private PaymentDao paymentDao;
	@Inject
	private DalinDao dalDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private UseCashDao ucDao;

	public int insertCashToDalin(RequestPayment rp,String username) {
		// 랜덤한 코드 8자리 생성후 결제코드로 입력
		String code = RandomStringUtils.randomAlphanumeric(6);
		rp.setPCode(code);
		Dalin dalin = dalDao.findByDalin(username);
		rp.setDMno(dalin.getDMno());
		rp.setFNo(dalin.getFNo());
		rp.setDTel(dalin.getDTel());
		rp.setDEmail(dalin.getDEmail());
		// 충전요청한 금액만큼 보유 캐쉬 변경
		return paymentDao.insertToPayment(rp);
	}
	
	public RequestPayment reqCashMember(String username) {
		return paymentDao.findByPayment(username);
	}
	
	public int readToDalinCash(String dEmail) {
		return paymentDao.findByDalinCash(dEmail);
	}
	
	public int addCashToDalin(String pCode,String username) {
		int money = paymentDao.findToCash(pCode);
		paymentDao.addCashToDalin(Dalin.builder().dEmail(username).dCash(money).build());
		// 결제내역 출력을위한 결제내역 입력.
		paymentDao.insertToNowPayment(NowPayment.builder().dEmail(username).pCode(pCode).pDate(LocalDateTime.now()).pMoney(money).build());
		return paymentDao.deleteToPayment(username);
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
