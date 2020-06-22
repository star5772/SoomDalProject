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
	private int rbNo;
	private String rbTitle;
	private String rbContent;
	private LocalDateTime rbWriteDate;
	private String rbWriter;
	private int rbReadCnt;
	private int rbReportCnt;
	private boolean rbIsReport;
	private boolean rbIsBlock;
	private boolean rbIsNotice;
	private int rNo;
	private int jMno;
}
