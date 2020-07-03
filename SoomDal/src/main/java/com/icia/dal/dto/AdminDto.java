package com.icia.dal.dto;

import lombok.*;
import lombok.experimental.*;


public class AdminDto {
	private AdminDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class JejaForList {
		private String jMno;
		private String jEmail;
		private String jName;
		private String jTel;
		private int jAccusationCnt;
		private String jJoinDate;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class ReportedReviewForList {
		private String rDate;
		private String rWriter;
		private int rScore;
		private String rContent;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class JejaEnabledList {
		private int jMno;
		private String jName;
		private String jJoinDate;
		private boolean enabled;
		private boolean jIsBlock;
		private String jEmail;
	}
	
	
}
