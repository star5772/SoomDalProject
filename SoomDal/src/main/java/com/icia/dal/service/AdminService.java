package com.icia.dal.service;

import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.Exception.JobFailException;
import com.icia.dal.dao.AdminDao;
import com.icia.dal.dao.DAO;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.PaymentDao;
import com.icia.dal.dto.AdminDto;
import com.icia.dal.dto.EnabledPage;
import com.icia.dal.dto.RefundDto;
import com.icia.dal.dto.page.PageToDalinAdmin;
import com.icia.dal.dto.page.PageToJejaAdmin;
import com.icia.dal.dto.page.PageToRefund;
import com.icia.dal.dto.page.PageToReportedJeja;
import com.icia.dal.dto.page.PageToReportedReview;
import com.icia.dal.entity.Admin;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.DetailField;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.Level;
import com.icia.dal.entity.NowPayment;
import com.icia.dal.entity.NowRefund;
import com.icia.dal.entity.ReportedBoard;
import com.icia.dal.entity.RequestBoard;
import com.icia.dal.util.pagingutil.AdminToDalinPagingUtil;
import com.icia.dal.util.pagingutil.AdminToJejaPagingUtil;
import com.icia.dal.util.pagingutil.EnabledPagingUtil;
import com.icia.dal.util.pagingutil.RefundPagingUtil;
import com.icia.dal.util.pagingutil.ReportedJejaPagingUtil;
import com.icia.dal.util.pagingutil.ReportedPagingUtil;

@Service
public class AdminService {
	@Inject
	private AdminDao adminDao;
	@Inject
	private ModelMapper modelMapper;
	@Value("${FieldFolder}")
	private String fieldFolder;
	@Value("${FieldPath}")
	private String fieldPath;
	@Inject
	private PaymentDao npDao;
	@Inject
	private PasswordEncoder pwdEncoder;
	@Inject
	private DAO authDao;
	@Inject
	private JejaDao jejaDao;

	@Transactional
	public int joinAdmin(Admin ad,String adCode) {
		if(adCode.equals("cktofhdl")==false)
			throw new JobFailException("관리자코드가 올바르지 않습니다");
		String pwd = ad.getPassword();
		String encoded = pwdEncoder.encode(pwd);
		ad.setPassword(encoded);
		authDao.insertAuthority(ad.getUsername(), "ROLE_ADMIN");
		return adminDao.insertAdmin(ad);
	}
	
	public PageToDalinAdmin adminPageToDalin(int pagene) {
		int countOfBoard = adminDao.countToDalin();
		PageToDalinAdmin adPage = AdminToDalinPagingUtil.getPage(pagene, countOfBoard);
		int srn = adPage.getStartRowNum();
		int ern = adPage.getEndRowNum();
		List<Dalin> adminList = adminDao.findAllToDalin(srn, ern);
		List<AdminDto.DalinForList> dtoList = new ArrayList<AdminDto.DalinForList>();
		for(Dalin dal:adminList) {
			AdminDto.DalinForList dto = modelMapper.map(dal,AdminDto.DalinForList.class);
			Level level = dal.getDLevel();
			dto.setDLevelStr(level.name());
			dto.setDDateStr(dal.getDDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));	
			dtoList.add(dto);
		}
		adPage.setList(dtoList);
		return adPage;
	}
	
	public PageToJejaAdmin adminPageToJeja(int pageno) {
		int countOfBoard = adminDao.countToJeja();
		PageToJejaAdmin adPage = AdminToJejaPagingUtil.getPage(pageno, countOfBoard);
		int srn = adPage.getStartRowNum();
		int ern = adPage.getEndRowNum();
		List<Jeja> adminList = adminDao.findAllToJeja(srn, ern);
		List<AdminDto.JejaForList> dtoList = new ArrayList<AdminDto.JejaForList>();
		for(Jeja jeja:adminList) {
			AdminDto.JejaForList dto = modelMapper.map(jeja,AdminDto.JejaForList.class);
			dto.setJJoinDate(jeja.getJJoinDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));	
			dtoList.add(dto);
		}
		adPage.setList(dtoList);
		return adPage;
	}	
	
	public PageToReportedJeja reportedPage(int pageno) {
		int countOfBoard = adminDao.countToReportedJeja();
		PageToReportedJeja repPage = ReportedJejaPagingUtil.getPage(pageno, countOfBoard);
		int srn = repPage.getStartRowNum();
		int ern = repPage.getEndRowNum();
		List<Jeja> jejaRpList = adminDao.findAllToRpList(srn, ern);
		List<AdminDto.ReportedJejaForList> dtoList = new ArrayList<AdminDto.ReportedJejaForList>();
		for(Jeja jeja:jejaRpList) {
			AdminDto.ReportedJejaForList dto = modelMapper.map(jeja,AdminDto.ReportedJejaForList.class);
			dto.setJJoinDateStr(jeja.getJJoinDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			dtoList.add(dto);
		}
		repPage.setList(dtoList);
		return repPage;
	}
	
	public PageToReportedReview ReviewPage(int pageno) {
		int countOfBoard = adminDao.countToReview();
		PageToReportedReview repPage = ReportedPagingUtil.getPage(pageno, countOfBoard);
		int srn = repPage.getStartRowNum();
		int ern = repPage.getEndRowNum();
		List<RequestBoard> rpboardList = adminDao.findAllToReportedBoard(srn, ern);
		List<AdminDto.ReportedBoardForList> dtoList = new ArrayList<AdminDto.ReportedBoardForList>();
		for(RequestBoard rqboard:rpboardList) {
			AdminDto.ReportedBoardForList dto = modelMapper.map(rqboard,AdminDto.ReportedBoardForList.class);
			Jeja jeja = jejaDao.findByJejaToJMno(rqboard.getJMno());
			ReportedBoard rbboard = adminDao.readRpBoard(rqboard.getRbNo());
			dto.setReason(rbboard.getReason());
			dto.setJEmail(jeja.getJEmail());
			dto.setRbWriteDateStr(rqboard.getRbWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			dtoList.add(dto);
		}
		repPage.setList(dtoList);
		return repPage;
	}
	
	// 블락유저(제자) 페이징
	public EnabledPage EnabledPage(int pageno) {
		int countOfBoard = adminDao.countToJejaEnabled();
		EnabledPage enaPage = EnabledPagingUtil.getPage(pageno, countOfBoard);
		int srn = enaPage.getStartRowNum();
		int ern = enaPage.getEndRowNum();
		List<Jeja> enabledList = adminDao.findAllEnabledToJeja(srn, ern);
		List<AdminDto.JejaEnabledList> dtoList = new ArrayList<AdminDto.JejaEnabledList>();
		for(Jeja jeja:enabledList) {
			AdminDto.JejaEnabledList dto = modelMapper.map(jeja,AdminDto.JejaEnabledList.class);
			dto.setJJoinDate(jeja.getJJoinDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			dtoList.add(dto);
		}
		enaPage.setList(dtoList);
		return enaPage;
	}
	
	// 환불요청 페이징
	public PageToRefund RefundPage(int pageno) {
		int countOfBoard = adminDao.countToRefund();
		PageToRefund refundPage = RefundPagingUtil.getPage(pageno, countOfBoard);
		int srn = refundPage.getStartRowNum();
		int ern = refundPage.getEndRowNum();
		List<NowRefund> refundList = adminDao.findAllNowRefundList(srn, ern);
		List<RefundDto.DtoForListToRefund> dtoList = new ArrayList<RefundDto.DtoForListToRefund>();
		for(NowRefund nowRefund:refundList) { 
			RefundDto.DtoForListToRefund dto = modelMapper.map(nowRefund, RefundDto.DtoForListToRefund.class);
			NowPayment np = npDao.findByNowpayment(dto.getDEmail());
			System.out.println(np);
			dto.setPReqRefundDate(nowRefund.getPReqRefundDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			String str = np.getPDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			dto.setPDateStr(str);
			dtoList.add(dto);
		}
		refundPage.setList(dtoList);
		return refundPage;
	}
	
	
	
	// 세부분야 목록 출력
	public List<DetailField> detailFnameList(String fNo) {
		List<DetailField> dfList = adminDao.findAllDetailField(fNo);
		return dfList;
	}
	
	@Transactional
	public int insertDetailFieldSajin(DetailField df,MultipartFile sajin) throws IllegalStateException, IOException {

		if(sajin != null && sajin.isEmpty()==false) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File fieldSajin = new File(fieldFolder,df.getDetailFName() + "." + extension);
				
				sajin.transferTo(fieldSajin);
				df.setDetailFSajin(fieldPath + fieldSajin.getName()); 
			}else {
				df.setDetailFSajin(fieldPath + "anony.jpg");
			}
		}else {
			df.setDetailFSajin(fieldPath+ "anony.jpg");
		}
		return adminDao.insertToDetailFName(df);
	}
	
	
	
	 
}
