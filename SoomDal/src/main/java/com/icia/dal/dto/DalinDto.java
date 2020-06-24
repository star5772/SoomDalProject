package com.icia.dal.dto;

import java.time.LocalDateTime;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

public class DalinDto {
	private DalinDto() { }
	
	@Data
	public static class DtoForJoinToDalin {
		private Integer dMno;
		private String fNo;
		@Pattern(regexp="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", message = "아이디(이메일) 은 최대 50자 형식을 확인해주십시오")
		private String dEmail;
		@Pattern(regexp="(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$", message="비밀번호는 특수문자를 포함하는 영숫자 8~10자입니다")
		private String dPassword;
		@Pattern(regexp="^[가-힣]{2,5}$", message="이름은 한글 2~5자입니다")
		private String dName;
		@NotNull(message = "전화번호는 필수 입력입니다")
		private String dTel;
		private Boolean enabled;
		private LocalDateTime dDate;
		private String dArea;
		private String dMainService;
	}
}
