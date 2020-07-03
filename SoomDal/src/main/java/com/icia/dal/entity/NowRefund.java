package com.icia.dal.entity;

import java.time.LocalDateTime;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class NowRefund {
	private String pRefundCode; // 환불코드
	private String pCode; // 결제코드
	private LocalDateTime pReqRefundDate; // 환불신청날짜
	private Boolean pRefundIsOk; // 수락여부
	private Integer pMoney; // 돈
	private String dEmail; // 달인 아이디
}
