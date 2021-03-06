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
	private int qNo;
	private String qTitle;
	private String qContent;
	private LocalDateTime qWriteDate;
	private String qWriter;
	private Integer cNo;
	private Boolean qIsSecret;
	private Boolean qIsNotice;
	private String qName;
}
