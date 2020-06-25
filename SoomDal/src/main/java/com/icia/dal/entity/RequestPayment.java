package com.icia.dal.entity;

import lombok.Data;

@Data
public class RequestPayment {
	private String pCode;	// 서비스에서 생성
	private int pMoney;		// jsp에서 입력
	private int dMno;		// 서비스에서 입력
	private String fNo;		// 서비스에서 입력
	private String dEmail;	// Principal에서 입력
	private String dTel;	// 서비스에서 입력
}
