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
		private int jAccusationCnt;
		private String jJoinDate;
	}
	
	
}
