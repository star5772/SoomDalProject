package com.icia.dal.dto;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

public class QnaDto {
	private QnaDto() {}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForQnaRead{
		private int qno;
		private String title;
		private String content;
		private String writeDateStr;
		private String writer;
		private int cno;
		private boolean secret;
		
	}
}
