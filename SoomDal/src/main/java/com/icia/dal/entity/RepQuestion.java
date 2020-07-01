package com.icia.dal.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class RepQuestion {
	private int dQno;
	private String dEmail;
	private String dQcontent;
}
