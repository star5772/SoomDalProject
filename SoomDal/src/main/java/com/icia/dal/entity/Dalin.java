package com.icia.dal.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Dalin {
	private Integer dMno;
	private String fNo;
	private String dEmail;
	private String dPassword;
	private String dName;
	private String dTel;
	private Boolean enabled;
	private LocalDateTime dDate;
	private Integer dCash;
	private String dProfile;
	private String dMainService;
	private String dIntro;
	private String dDetailService;
	private String dArea;
	private Integer pAttachmentCnt;
	private Level dLevel;
	private Integer rNo;
	private Integer pAttachmentNo;
	private Integer dQNo;
	private String dPaymentMethod;
}
