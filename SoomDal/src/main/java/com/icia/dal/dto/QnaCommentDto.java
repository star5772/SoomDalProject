package com.icia.dal.dto;

import lombok.Data;
import lombok.experimental.Accessors;

public class QnaCommentDto {
	private QnaCommentDto() {
	}
	
	@Data
	public static class DtoForCommentRead {
		private int cNo;
		private Integer qNo;
		private String cContent;
		private String cWriteDateStr;
	}
	
}
