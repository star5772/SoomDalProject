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
public class NowPayment {
	private String pCode;
	private LocalDateTime pDate;
	private Integer pRefundDate;
	private Boolean pRefundIsOk;
	private String dEmail;
	private Integer pMoney;
}
