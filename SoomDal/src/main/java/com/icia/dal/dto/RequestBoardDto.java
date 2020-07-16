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
		private String fieldOrHobby;
		private String lessonPurpose;
		private String myLevel;
		private String tools;
		private String lesson;
		private String lessonTime;
		private String age;
		private String gender;
		private String zone;
		private String etc;
		private String rbWriteDateStr;
		private String rbWriter;
		private int rbReadCnt;
		private int rbReportCnt;
		private boolean rbIsReport;
		private boolean rbIsBlock;
		private boolean rbIsNotice;
		private int jMno;
		private int rNo;
		private String jName;
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForWrite {
		private String rbTitle;
		private String fieldOrHobby;
		private String lessonPurpose;
		private String myLevel;
		private String tools;
		private String lesson;
		private String lessonTime;
		private String age;
		private String gender;
		private String zone;
		private String etc;
		private String rbWriter;
		private LocalDateTime rbWriteTime;
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForList {
		private Integer rbNo;
		private String rbTitle;
		private String rbWriteDateStr;
		private String rbWriter;
		private Integer rbReadCnt;
		private Boolean rbIsNotice;
	}
	
}
