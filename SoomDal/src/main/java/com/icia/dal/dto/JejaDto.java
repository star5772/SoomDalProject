package com.icia.dal.dto;

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
