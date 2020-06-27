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
public class Request {
	private Integer rNo;
	private Integer jMno;
	private String rField;
	private String rSubject;
	private String rLessonPurpose;
	private String rYourLevel;
	private String rItemExists;
	private String rLessonType;
	private LocalDateTime rWantDate;
	private LocalDateTime rWantTime;
	private String rAge;
	private Boolean rGender;
	private Boolean rDalinIsOk;
	private String rWannable;
	private String rWantArea;
	private LocalDateTime rWriteDate;
	private Integer dMno;
	private Boolean rbEnabled;				// 달인이 요청서 수락전이면 삭제가능.
}
