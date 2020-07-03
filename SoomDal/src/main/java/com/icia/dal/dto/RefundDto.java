package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

public class RefundDto {
	private RefundDto() {}

	@NoArgsConstructor
	@AllArgsConstructor
	@Data
	@Builder
	public static class DtoForListToRefund{ 
		private String pReqRefundDate; // 환불 신청날짜
		private String pCode; // 결제코드
		private String pRefundDate;  // 환불가능일 
		private String dEmail; // 달인 아이디
		private String pRequestRefund; // 환불요청
		private String pRefundIsOk; // 환불수락여부
		private String pDate; // 결제날짜
		private int pRequestMoney; // 환불요청금액
	}
}
