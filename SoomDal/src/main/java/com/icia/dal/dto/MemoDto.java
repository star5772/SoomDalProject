package com.icia.dal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class MemoDto {
	private MemoDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForMemoList{
		private int mno;
		private String title;
		private String sender;
		private String receiver;
		private String writeTimeStr;
		private String profile;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForMemoRead{
		private String mno;
		private String title;
		private String content;
		private String sender;
		private String receiver;
		private String writeTimeStr;
		private String profile;
	}

}
