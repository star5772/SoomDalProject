package com.icia.dal.util;

import com.icia.dal.dto.PageToQnaBoard;

public class QnaBoardPagingUtil {
		private final static int COUNT_OF_BOARD_PER_PAGE = 10;
		private final static int COUNT_OF_BOARD_PER_BLOCK = 5;
		
		public static PageToQnaBoard getPage(int pageno, int countOfBoard) {
			
			int countOfPage = countOfBoard/COUNT_OF_BOARD_PER_PAGE + 1;
			if(countOfBoard%COUNT_OF_BOARD_PER_PAGE == 0)
				countOfPage--;
			if(pageno>countOfPage)
				pageno=countOfPage;
					
			int startRowNum = (pageno-1)*COUNT_OF_BOARD_PER_PAGE +1;
			int endRowNum = startRowNum + COUNT_OF_BOARD_PER_PAGE - 1;
					
			endRowNum = (endRowNum>countOfBoard)?countOfBoard:endRowNum;
			
			int blockNo = (pageno-1)/COUNT_OF_BOARD_PER_BLOCK;
			int startPage = blockNo * COUNT_OF_BOARD_PER_BLOCK + 1;
			int endPage = startPage + COUNT_OF_BOARD_PER_BLOCK - 1;
					
			endPage = (endPage>countOfPage)?countOfPage:endPage;
					
			boolean isPrev = blockNo>0? true : false;
			boolean isNext = endPage != countOfPage? true: false; 
					
			return PageToQnaBoard.builder().startPage(startPage).endPage(endPage).startRowNum(startRowNum).endRowNum(endRowNum).isPrev(isPrev).isNext(isNext).pageno(pageno).build();
			}
			
}
