package com.icia.dal.dto;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

public class JejaDto {
	private JejaDto() {
		
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForJejaRead {
		private String email;
		private String name;
		private String tel;
		private int jMno;
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForJejaUpdate {
		private String newName;
		private String jPassword;
		private String newPassword;
		private String newTel;
	}
	
	
}
