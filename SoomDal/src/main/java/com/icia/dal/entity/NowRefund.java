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
	private String pRefundCode;
	private String pCode;
	private LocalDateTime pReqRefundDate;
	private Boolean pRefundIsOk;
}
