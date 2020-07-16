package com.icia.dal.dto.page;

import java.util.List;

import com.icia.dal.dto.RefundDto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageToRefund {
	private int startRowNum;
	private int endRowNum;
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	private List<RefundDto.DtoForListToRefund> list;
}
