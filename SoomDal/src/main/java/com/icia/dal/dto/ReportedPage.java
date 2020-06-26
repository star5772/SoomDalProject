package com.icia.dal.dto;

import java.util.*;

import lombok.*;

@Data
@Builder
public class ReportedPage {
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private boolean isPrev;
	private int endPage;
	private boolean isNext;
	private int startPage;
	
	List<AdminDto.ReportedReviewForList> list;
}
