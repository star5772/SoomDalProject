package com.icia.dal.entity;

import java.time.*;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Review {
	private int rNo;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private LocalDateTime rDate;
	private String rContent;
	private int rScore;
	private int rSajin;
	private String rWriter;
	private int sNo;
	private int dMno; // 달인회원번호
}
