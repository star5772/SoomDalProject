package com.icia.dal.entity;

import lombok.Data;

@Data
public class RequestPayment {
	private String pCode;
	private int pMoney;
	private int dMno;
	private String fNo;
	private String dEmail;
}
