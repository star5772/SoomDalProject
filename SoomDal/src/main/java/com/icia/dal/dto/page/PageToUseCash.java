package com.icia.dal.dto.page;

import java.util.List;

import com.icia.dal.dto.UseCashDto;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class PageToUseCash {
	// 아래 두 필드는 페이지네이션과 상관없다
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	
	List<UseCashDto.DtoForList> list;
}
