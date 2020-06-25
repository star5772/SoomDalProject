package com.icia.dal.dto;

import lombok.Data;

public class ReviewDto {
	private ReviewDto() {}
	
	@Data
	public static class DtoForDalinProfileReviewToread {
		private int rNo;
		private String rDateStr;
		private String rContent;
		private int rScore;
		private String rWriter;
		private Double rScoreAverage;
	}

}
