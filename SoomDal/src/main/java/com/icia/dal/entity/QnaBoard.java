package com.icia.dal.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class QnaBoard {
	private String qNo;
	private String qTitle;
	private String qContent;
	private LocalDateTime qWriteDate;
	private String qWriter;
	private int cNo;
	private boolean qIsSecret;
	private boolean qIsNotice;
}
