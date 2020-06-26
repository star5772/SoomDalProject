package com.icia.dal.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Review {
	private int rNo;
	private LocalDateTime rDate;
	private String rContent;
	private int rScore;
	private int rSajin;
	private String rWriter;
	private int sNo;
	private int dMno; // 달인회원번호
}
