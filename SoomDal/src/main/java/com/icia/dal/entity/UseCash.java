package com.icia.dal.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UseCash {
	private int eNo;
	private int dMno;
	private int caEstimateCash;
	private LocalDateTime caUseDate;
}
