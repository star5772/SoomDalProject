package com.icia.dal.dto;

import java.util.List;

import com.icia.dal.entity.RequestPayment;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageToRequestPayment {
	// 아래 두 필드는 페이지네이션과 상관없다
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	
	List<RequestPaymentDto.DtoForListToReuqestPayment> list;
}
