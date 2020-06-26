package com.icia.dal.dto;

import java.util.*;

import lombok.*;

@Data
@Builder
public class PageToDalinField {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	List<DalinDto.DtoForFieldList> list;
}
