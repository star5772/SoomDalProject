package com.icia.dal.service;

import java.time.format.*;
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
}
