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
	private int qNo;
	private String cContent;
	private LocalDateTime cWriteDate;
	private String adEmail;
}
