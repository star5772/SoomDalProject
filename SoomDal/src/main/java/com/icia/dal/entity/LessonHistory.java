package com.icia.dal.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LessonHistory {
	private String aCompleteCode;
	private int dMno;
	private int jMno;
	private LocalDateTime lStartDate;
	private boolean rIsOk;
}
