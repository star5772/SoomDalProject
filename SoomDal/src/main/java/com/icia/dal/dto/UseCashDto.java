package com.icia.dal.dto;

import lombok.Data;

public class UseCashDto {
	
	private UseCashDto() { }
	
	@Data
	public static class DtoForList {
		private int eNo;
		private int dMno;
		private int caEstimateCash;
		private String caUseDateStr;
	}
}
