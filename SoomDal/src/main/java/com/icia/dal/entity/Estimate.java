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
public class Estimate {
	private Integer eNo;
	private Integer dMno;
	private String fNo;
	private Integer jMno;
	private Integer rNo;
	private String dEmail;
	private Integer eMoney;
	private String eContent;
	private String eTelType;
	private Boolean jIsOk;
	private Integer eCash;
	private LocalDateTime eWriteTime;
	private Boolean eIsRead;
}
