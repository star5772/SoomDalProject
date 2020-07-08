package com.icia.dal.dto.page;

import java.util.*;

import com.icia.dal.dto.AdminDto;

import lombok.*;

@Data
@Builder
public class PageToReportedReview {
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private boolean isPrev;
	private int endPage;
	private boolean isNext;
	private int startPage;
	
	List<AdminDto.ReportedBoardForList> list;
}
