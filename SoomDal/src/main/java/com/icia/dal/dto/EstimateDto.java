package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

public class EstimateDto {
	private EstimateDto() {}
	
	
	@Data
	@AllArgsConstructor
	public static class DtoForList {
		private int eNo;
		private int dMno;
		private String fNo;
		private int jMno;
		private int rNo;
		private String dEmail;
		private Boolean jIsOk;
	}
	
	@Data
	@AllArgsConstructor
	public class DtoForRead {
		private int eNo;
		private int dMno;
		private int jMno;
		private int rNo;
		private int eMoney;
		private String dEmail;
		private String eContent;
		private String eTelType;
		private Boolean jIsOk;
	}
}
