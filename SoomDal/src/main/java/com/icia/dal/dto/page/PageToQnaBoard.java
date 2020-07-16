package com.icia.dal.dto.page;

import java.util.List;

import com.icia.dal.dto.QnaDto;
import com.icia.dal.dto.QnaDto.DtoForQnaList;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageToQnaBoard {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	
	List<QnaDto.DtoForQnaList> list;
}
