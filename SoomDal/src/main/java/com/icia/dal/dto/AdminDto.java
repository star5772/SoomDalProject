package com.icia.dal.dto;

import com.icia.dal.entity.Level;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


public class AdminDto {
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class ReportedJejaForList {
		private String jMno;
		private String jEmail;
		private String jName;
		private String jTel;
		private int jAccusationCnt;
		private String jJoinDateStr;
		private boolean jIsBlock;
	}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DalinForList {
		private int dMno;
		private String detailFName;
		private String dEmail;
		private String dName;
		private String dTel;
		private String dDateStr;
		private Level dLevel;
		private boolean enabled;
	}

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
		private boolean jIsBlock;
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
