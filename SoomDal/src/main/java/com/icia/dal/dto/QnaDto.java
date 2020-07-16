package com.icia.dal.dto;


import com.icia.dal.entity.QnaComment;

import lombok.*;
import lombok.experimental.*;

public class QnaDto {
	private QnaDto() {}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForQnaRead{
		private int qNo;
		private String title;
		private String content;
		private String writeDateStr;
		private String writer;
		private Integer cno;
		private boolean secret;
		private String name;
		private QnaCommentDto.DtoForCommentRead comment;
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForQnaList {
		private int qNo;
		private String qTitle;
		private String qWriter;
		private String qWriteDateStr;
		private Boolean qIsSecret;
		private Boolean qIsNotice;
		private String qName;
	}
	
}
