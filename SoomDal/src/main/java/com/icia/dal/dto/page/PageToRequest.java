package com.icia.dal.dto.page;

import java.util.List;

import com.icia.dal.dto.RequestDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageToRequest {
		private int startRowNum;
		private int endRowNum;
		private int pageno;
		private int startPage;
		private int endPage;
		private boolean isPrev;
		private boolean isNext;
		List<RequestDto.DtoForList> list;
}
