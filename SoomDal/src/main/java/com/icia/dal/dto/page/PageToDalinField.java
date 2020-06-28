package com.icia.dal.dto.page;

import java.util.*;

import com.icia.dal.dto.DalinDto;
import com.icia.dal.dto.DalinDto.DtoForFieldList;

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
