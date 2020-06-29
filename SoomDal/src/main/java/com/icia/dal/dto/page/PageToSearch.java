package com.icia.dal.dto.page;

import java.util.*;

import com.icia.dal.dto.*;

import lombok.*;

@Data
@Builder
public class PageToSearch {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	private int count;
	private String searchType;
	private String keyword;
	List<DalinDto.DtoForFieldList> list;
}
