package com.icia.dal.dto;

import lombok.Data;
public class RequestPaymentDto {
	
	@Data
	public static class DtoForListToReuqestPayment {
		private String pCode;
		private String pMoneyStr;
		private int dMno;
		private String fNo;
		private String dEmail;
	}
}
