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
@Accessors(chain=true)
public class ProfileAttachment {
	private Integer pAttachmentNo; // 프로필 첨부파일 번호
	private String pOriginalFileName; // 원래  파일 이름
	private String pSaveFileName; // 저장용 파일이름
	private String dEmail; // 달인 번호
}
