package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class RequestDto {
	
	private RequestDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForList {
		private int rNo;
		private int jMno;
		private String rSubject;
		private String rField;
		private Boolean rDalinIsOk;
		private String rWantArea;
		private String rWriteDateStr;
		private int dMno;
		private Boolean rbEnabled;
		private String jName;
		private String dName;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForRead {
		private int rNo;
		private int jMno;
		private String rField;
		private String rSubject;
		private String rLessonPurpose;
		private String rYourLevel;
		private String rLessonType;
		private String rWantDateStr;
		private String rWantTime;
		private String rItemExists;
		private String rAge;
		private Boolean rGender;
		private Boolean rDalinIsOk;
		private String rWannable;
		private String rWantArea;
		private String rWriteDateStr;
		private int dMno;
		private Boolean rbEnabled;
		private String jName;
		private String jEmail;
	}
	
}
