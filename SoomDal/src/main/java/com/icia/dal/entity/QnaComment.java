package com.icia.dal.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class QnaComment {
	private int cNo;
	private String cCode;
	private String cContent;
	private LocalDateTime cWrite;
	private String adEmail;
}
