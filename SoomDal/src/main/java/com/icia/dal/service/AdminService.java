package com.icia.dal.service;

import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.dao.AdminDao;
import com.icia.dal.dto.AdminDto;
import com.icia.dal.dto.EnabledPage;
import com.icia.dal.dto.ReportedPage;
import com.icia.dal.dto.page.AdminPage;
import com.icia.dal.entity.DetailField;
import com.icia.dal.entity.Field;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.Review;
import com.icia.dal.util.EnabledPagingUtil;
import com.icia.dal.util.pagingutil.AdminPagingUtil;
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
	

	public AdminPage adminPage(int pageno) {
		int countOfBoard = adminDao.countToJeja();
		AdminPage adPage = AdminPagingUtil.getPage(pageno, countOfBoard);
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
	
	public ReportedPage reportedPage(int pageno) {
		int countOfBoard = adminDao.countToReportedJeja();
		ReportedPage repPage = ReportedPagingUtil.getPage(pageno, countOfBoard);
		int srn = repPage.getStartRowNum();
		int ern = repPage.getEndRowNum();
		int jac = repPage.getJAccusationCnt();
		List<Jeja> jejaRpList = adminDao.findAllToRpList(srn, ern, jac);
		List<AdminDto.ReportedReviewForList> dtoList = new ArrayList<AdminDto.ReportedReviewForList>();
		for(Jeja jeja:jejaRpList) {
			AdminDto.ReportedReviewForList dto = modelMapper.map(jeja,AdminDto.ReportedReviewForList.class);
			dto.setRDate(jeja.getJJoinDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			dtoList.add(dto);
		}
		repPage.setList(dtoList);
		return repPage;
	}
	
	public ReportedPage ReviewPage(int pageno) {
		int countOfBoard = adminDao.countToReview();
		ReportedPage repPage = ReportedPagingUtil.getPage(pageno, countOfBoard);
		int srn = repPage.getStartRowNum();
		int ern = repPage.getEndRowNum();
		List<Review> reviewList = adminDao.findAllToReview(srn, ern);
		List<AdminDto.ReportedReviewForList> dtoList = new ArrayList<AdminDto.ReportedReviewForList>();
		for(Review review:reviewList) {
			AdminDto.ReportedReviewForList dto = modelMapper.map(review,AdminDto.ReportedReviewForList.class);
			dto.setRDate(review.getRDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
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
	
	// 세부분야 목록 출력
	public List<DetailField> detailFnameList(String fNo) {
		List<DetailField> dfList = adminDao.findAllDetailField(fNo);
		for(DetailField df:dfList)
			dfList.add(df);
		return dfList;
	}
	
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
	
	public List<Field> fieldList() {
		List<Field> fList = adminDao.findAllField();
		for(Field fl:fList)
			fList.add(fl);
		return fList;
	}
	
	public int insertFieldSajin(Field fl,MultipartFile sajin) throws IllegalStateException, IOException {
		if(sajin != null && sajin.isEmpty()==false) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File fieldSajin = new File(fieldFolder,fl.getFName() + "." + extension);
				
				sajin.transferTo(fieldSajin);
				fl.setFSajin(fieldPath + fieldSajin.getName()); 
			}else {
				fl.setFSajin(fieldPath + "anony.jpg");
			}
		}else {
			fl.setFSajin(fieldPath+ "anony.jpg");
		}
		return adminDao.insertToField(fl);
	}

}
