package com.icia.dal.dto.page;

import java.util.List;

import com.icia.dal.dto.EstimateDto;
import com.icia.dal.dto.EstimateDto.DtoForList;

import lombok.Data;

import lombok.Builder;
@Data
@Builder
public class PageToEstimate {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	List<EstimateDto.DtoForList> list;
}
