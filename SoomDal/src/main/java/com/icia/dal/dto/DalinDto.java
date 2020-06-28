package com.icia.dal.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.Pattern;

import com.icia.dal.entity.Review;
import com.icia.dal.entity.ProfileAttachment;

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
		@Pattern(regexp="^[0,9]{8,11}$", message="전화번호는 숫자 8~11자입니다")
		private String dTel;
		private String detailFName;
		private Boolean enabled;
		private LocalDateTime dDate;
		private String dArea;
	}
	
	@Data
	public static class DtoForProfileToDalin{
		private Integer dMno;
		private String dName;
		private String dProfile;
		private String dIntro;
		private String dMainService;
		private String dArea;
		private String dDetailService;
		private String dPaymentMethod;
		private String dAttachmentNo;
		private Integer rNo;
		private Integer dQNo;
		private List<Review> reviews;
		private List<ProfileAttachment> ProfileAttachments;
	}
	
	@Data
	public static class DtoForUpdateToDalinProfile {
		private Integer dMno;
		private String dProfile;
		private String dName;
		private String dArea;
		private String dIntro;
		private String dDetailService;
		private String dPaymentMethod;
		private Integer pAttachmentCnt;
		private Integer rNo;
		private Integer pAttachmentNo;
		private Integer dQNo;
	}
	
	@Data
	public static class DtoForUpdateToDalin {
		private Integer dMno;
		@Pattern(regexp="^[가-힣]{2,5}$", message="이름은 한글 2~5자입니다")
		private String dName;
		@Pattern(regexp="(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$", message="비밀번호는 특수문자를 포함하는 영숫자 8~10자입니다")
		private String dPassword;
		@Pattern(regexp="(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$", message="비밀번호는 특수문자를 포함하는 영숫자 8~10자입니다")
		private String newDPassword;
		@Pattern(regexp="^[0,9]{8,11}$", message="전화번호는 숫자 8~11자입니다")
		private String dTel;
		private Integer dCash;
	}
	
	@Data
	public static class DtoForFieldList {
		private String dProfile;
		private String dName;
		private String dIntro;
	}
}
