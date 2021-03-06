package com.icia.dal.entity;

import java.time.*;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class Jeja {
	private int jMno; // 제자 회원 번호
	private String jEmail; // 회원 id(eamil)
	private String jPassword; // 회원 비밀번호
	private String jName; // 회원이름
	private String jTel; // 회원 전화번호
	private Integer jAccusationCnt; // 신고수
	private Boolean enabled; // 회원 상태
	private LocalDateTime jJoinDate; // 가입 날짜
	private Integer jLoginFailureCnt; // 로그인실패수
	private Boolean jIsBlock;	// 블락여부
	
}
