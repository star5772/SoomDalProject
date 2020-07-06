package com.icia.dal.dto.page;

import java.util.*;

import com.icia.dal.dto.AdminDto;
import com.icia.dal.dto.AdminDto.ReportedReviewForList;

import lombok.*;

@Data
@Builder
public class PageToReportedJeja {
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private boolean isPrev;
	private int endPage;
	private boolean isNext;
	private int startPage;
	
	List<AdminDto.ReportedJejaForList> list;
}
