package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class ReviewAuthDto {
	
	private ReviewAuthDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForList{
		private String jEmail;
	}
}
