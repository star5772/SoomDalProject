package com.icia.dal.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.entity.ProfileAttachment;
import com.icia.dal.entity.RepQuestion;
import com.icia.dal.entity.Review;

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
	public static class DtoForProfileUpdateToDalin{
		private Integer dMno;
		private String dIntro;
		private String dMainService;
		private String dArea;
		private String dDetailService;
		private String dPaymentMethod;
		private List<MultipartFile> ProfileAttachments;
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
		private List<RepQuestion> rep;
		private List<Review> reviews;
		private Double rScoreAverage;
		private List<ProfileAttachment> ProfileAttachments;
	}	
	@Data
	public static class DtoForMyInfo {
		private int dMno;
		private String dName;
		private	String dEmail;
		private String dProfile;
		private String dTel;
		private int dCash;
		private String dLevelStr;
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
		@Pattern(regexp="^[0-9]{8,11}$", message="전화번호는 숫자 8~11자입니다")
		private String dTel;
		private Integer dCash;
		private String dEmail;
	}
	
	@Data
	public static class DtoForFieldList {
		private String dMno;
		private String dProfile;
		private String dName;
		private String dIntro;
		private Double avgScore;
	}
	
	@Data
	public static class DtoForFieldInfo {
		private String fNo;
		private String detailFName;
		private String detailSajin;
		private Double avgScore;
	}
	
}
