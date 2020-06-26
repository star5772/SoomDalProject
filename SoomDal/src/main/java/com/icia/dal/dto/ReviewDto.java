package com.icia.dal.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

public class ReviewDto {
	private ReviewDto() {}
	
	@Data
	public static class DtoForDalinProfileReviewToread {
		private int rNo;
		@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
		private LocalDateTime rDate;
		private String rContent;
		private int rScore;
		private String rWriter;
		private Double rScoreAverage;
	}

}
