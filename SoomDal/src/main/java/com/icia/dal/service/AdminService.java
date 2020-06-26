package com.icia.dal.service;

import java.util.*;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.dto.AdminDto.*;
import com.icia.dal.entity.*;
import com.icia.dal.util.*;

@Service
public class AdminService {
	@Inject
	private AdminDao adminDao;
	@Inject
	private ModelMapper modelMapper;
	
	/*
	 * public AdminPage list(int pageno, String jName) { int countOfBoard =
	 * adminDao.countToJeja(); AdminPage adPage = PagingUtil.getPage(pageno,
	 * countOfBoard); int srn = adPage.getStartRowNum(); int ern =
	 * adPage.getEndRowNum(); List<Jeja> adminList = adminDao.findAllToJeja(srn,
	 * ern); List<AdminDto.JejaForList> dtoList = new
	 * ArrayList<AdminDto.JejaForList>(); for(Jeja jeja:JejaForList) {
	 * 
	 * } }
	 */
}
