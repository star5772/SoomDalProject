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
<<<<<<< HEAD
	private String qNo;
=======
	private int qNo;
>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
	private String qTitle;
	private String qContent;
	private LocalDateTime qWriteDate;
	private String qWriter;
	private int cNo;
	private boolean qIsSecret;
	private boolean qIsNotice;
}
