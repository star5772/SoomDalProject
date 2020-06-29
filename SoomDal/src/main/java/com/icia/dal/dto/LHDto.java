package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

public class LHDto {
	private LHDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForList{
		private String aCompleteCode;
		private int dMno;
		private int jMno;
		private String lStartDate;
		
		private String dProfile;
		private String detailFName;
		private String dName;
	}
}
