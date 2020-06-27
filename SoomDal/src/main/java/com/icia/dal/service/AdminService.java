package com.icia.dal.service;

import java.time.format.*;
import java.util.*;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.page.AdminPage;
import com.icia.dal.entity.*;
import com.icia.dal.util.*;
import com.icia.dal.util.pagingutil.AdminPagingUtil;
import com.icia.dal.util.pagingutil.ReportedPagingUtil;

@Service
public class AdminService {
	@Inject
	private AdminDao adminDao;
	@Inject
	private ModelMapper modelMapper;
	

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
}
