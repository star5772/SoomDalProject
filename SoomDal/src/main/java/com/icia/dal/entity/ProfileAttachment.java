package com.icia.dal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProfileAttachment {
	private Integer pAttachmentNo; // 프로필 첨부파일 번호
	private String pOriginalFileName; // 원래  파일 이름
	private String pSaveFileName; // 저장용 파일이름
	private Boolean pIsOk; // 사진 파일 여부
	private Integer pAttachmentCnt; // 프로필 사진 개수
	private Integer dMno; // 달인 번호
}
