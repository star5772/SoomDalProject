package com.icia.dal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewAuthority {
	private String aCompleteCode;
	private Integer dMno;
	private Integer jMno;
	private Boolean aIsOk;
}
