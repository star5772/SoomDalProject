package com.icia.dal.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Dalin {
	private Integer dMno;				// 달인회원번호
	private String fNo;					// 분야 코드 ex) 스포츠,악기,미술
	private String detailFName;			// 세부분야이름 ex) 스케이트보드,스노우보드,농구
	private String dEmail;				// 달인아이디 (이메일형식)
	private String dPassword;			// 달인비밀번호
	private String dName;				// 달인 이름
	private String dTel;				// 달인 연락처
	private Boolean enabled;			// 로그인가능여부
	private LocalDateTime dDate;		// 레슨가능시간
	private Integer dCash;				// 달인보유캐쉬
	private String dProfile;			// 달인프로필사진
	private String dMainService;		// 달인 레슨 종류
	private String dIntro;				// 달인 소개
	private String dDetailService;		// 달인 레슨 세부내용
	private String dArea;				// 달인 레슨지역
	private Integer pAttachmentCnt;		// 프로필에들어가는 사진 개수
	private Level dLevel;				// 달인 회원등급
	private String dPaymentMethod;		// 레슨 결제수단
	private Integer rReviewCnt;			// 달인 리뷰개수
	private Integer dLoginFailureCnt; 	//로그인 실패수
}
