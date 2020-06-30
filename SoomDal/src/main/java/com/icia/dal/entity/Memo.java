package com.icia.dal.entity;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Memo {
	private Integer mno;
	@NotBlank
	@Pattern(regexp="^[\\w\\s가-힣!]{1,50}$", message ="제목은 영숫자와 한글, 특수문자 !만 사용할 수 있습니다")
	private String title;
	@NotBlank
	private String content;
	@Pattern(regexp="^[A-Za-z][A-Za-z0-9]{7,9}$", message="보낸 사람 아이디는 영숫자 8~10자입니다" )
	private String sender;
	@Pattern(regexp="^[A-Za-z][A-Za-z0-9]{7,9}$", message="받는 사람 아이디는 영숫자 8~10자입니다" )
	private String receiver;
	private LocalDateTime writeTime;
	private Boolean isRead;
	// 보낸 메모함에서 삭제할 경우 true
	private Boolean disableBySender;
	// 받은 메모함에서 삭제할 경우 true. 둘 다 true일 경우 Service에서 @Scheduled를 이용해 일정한 시각에 삭제
	private Boolean disableByReceiver;
}
