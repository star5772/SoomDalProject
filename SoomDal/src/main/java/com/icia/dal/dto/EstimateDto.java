package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class EstimateDto {
	private EstimateDto() {}
	
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForList {
		private int eNo;
		private int dMno;
		private String fNo;
		private int jMno;
		private int rNo;
		private String dEmail;
		private Boolean jIsOk;
		private String rSubject;
		private String eWriteTimeStr;
		private String dName;
		private String jName;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForRead {
		private int eNo;
		private int dMno;
		private int jMno;
		private int rNo;
		private int eMoney;
		private String dEmail;
		private String eContent;
		private String eTelType;
		private Boolean jIsOk;
		private String eWriteTimeStr;
		private String dName;
		private String jName;
		private String rSubject;
	}
}
