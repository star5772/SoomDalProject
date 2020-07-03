package com.icia.dal.service;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.stereotype.*;

import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.entity.*;

@Service
public class FieldService {
	@Inject
	private DetailFieldDao dfDao;
	@Inject
	private ModelMapper modelMapper;
	@Inject
	private ReviewDao reviewDao;

	public int info(String detailFName) {
		// dto > detailField + 해당 분야의 달인들의 평점을 더하고 해당 분야 활동 달인 수 로 나눈 값
		// 넣어주고 하면댐
		DetailField df = dfDao.findByName(detailFName);
		//DalinDto.DtoForFieldInfo dto = modelMapper.map(detail,DalinDto.DtoForFieldInfo.class);
		//Double avgScore = reviewDao;
		//dto.setAvgScore(avgScore);
		return 1;
	}
}
