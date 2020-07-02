package com.icia.dal.dto;

import lombok.Data;
import lombok.experimental.Accessors;

public class QnaCommentDto {
	private QnaCommentDto() {
	}
	
	@Data
	public static class DtoForCommentRead {
		private int cNo;
		private int qNo;
		private String cContent;
		private String cWriteDateStr;
	}
	
}
