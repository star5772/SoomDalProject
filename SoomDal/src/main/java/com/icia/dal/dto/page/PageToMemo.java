package com.icia.dal.dto.page;

import java.util.List;

import com.icia.dal.dto.MemoDto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageToMemo {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	List<MemoDto.DtoForMemoList> list;

}
