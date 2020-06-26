package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
public class NowPaymentDto {
	private NowPaymentDto(){}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForListToNowPayment {
		private String pCode;
		private String pDateStr;
		private int pRefundDate;
		private Boolean pRefundIsOk;
		private String dEmail;
		private int pMoney;
	}
}
