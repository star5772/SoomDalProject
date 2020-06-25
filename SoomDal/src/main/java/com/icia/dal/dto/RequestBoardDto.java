package com.icia.dal.dto;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

public class RequestBoardDto {
	private RequestBoardDto() {
		
	}
		
	@Data
	@Accessors(chain=true)
	public static class DtoForRead {
		private int rbNo;
		private String rbTitle;
		private String rbContent;
		private String rbWriteDateStr;
		private String rbWriter;
		private int rbReadCnt;
		private int rbReportCnt;
		private boolean rbIsReport;
		private boolean rbIsBlock;
		private boolean rbIsNotice;
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForWrite {
		private String rbTitle;
		private String rbContent;
		private String rbWriter;
	}
	
}
