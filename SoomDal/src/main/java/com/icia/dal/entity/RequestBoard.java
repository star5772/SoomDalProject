package com.icia.dal.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class RequestBoard {
	private Integer rbNo; 
	private String rbTitle; 
	private String fieldOrHobby;
	private String lessonPurpose;
	private String myLevel;
	private String tools;
	private String lesson;
	private String lessonTime;
	private String age;
	private String gender;
	private String zone;
	private String etc;
	private LocalDateTime rbWriteDate;
	private String rbWriter;
	private Integer rbReadCnt;
	private Integer rbReportCnt;
	private Boolean rbIsReport;
	private Boolean rbIsBlock;
	private Boolean rbIsNotice;
	private Integer rNo;
	private Integer jMno;
}
