package com.icia.dal.util.pagingutil;

import com.icia.dal.dto.page.*;

public class SearchPagingUtil {
	private final static int COUNT_OF_BOARD_PER_PAGE = 10;
	private final static int COUNT_OF_PAGE_PER_BLOCK = 5;
	
	public static PageToSearch getPage(int pageno, int countOfBoard) {
		
		int countOfPage = countOfBoard/COUNT_OF_BOARD_PER_PAGE + 1;
		if(countOfBoard%COUNT_OF_BOARD_PER_PAGE == 0)
			countOfPage--;
		if(pageno>countOfPage)
			pageno=countOfPage;
		
		System.out.println(pageno);
		int startRowNum = (pageno-1)*COUNT_OF_BOARD_PER_PAGE +1;
		System.out.println(startRowNum);
		int endRowNum = startRowNum + COUNT_OF_BOARD_PER_PAGE - 1;
		
		endRowNum = (endRowNum>countOfBoard)?countOfBoard:endRowNum;
		
		int blockNo = (pageno-1)/COUNT_OF_PAGE_PER_BLOCK;
		int startPage = blockNo * COUNT_OF_PAGE_PER_BLOCK + 1;
		int endPage = startPage + COUNT_OF_PAGE_PER_BLOCK - 1;
		
		endPage = (endPage>countOfPage)?countOfPage:endPage;
		
		boolean isPrev = blockNo>0? true : false;
		boolean isNext = endPage != countOfPage? true: false; 
		
		return PageToSearch.builder().startPage(startPage).endPage(endPage)
			.startRowNum(startRowNum).endRowNum(endRowNum)
			.isPrev(isPrev).isNext(isNext).pageno(pageno).count(countOfBoard).build();
	}
}
