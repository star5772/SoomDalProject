package com.icia.dal.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class ReportedBoard {
	private int rbNo;
	private String username;
	private String reason;
}
