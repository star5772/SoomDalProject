package com.icia.dal.dto.page;

import java.util.*;

import com.icia.dal.dto.RequestBoardDto;
import com.icia.dal.dto.RequestBoardDto.DtoForList;

import lombok.*;

@Data
@Builder
public class PageToRequestBoard {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	List<RequestBoardDto.DtoForList> list;
}
