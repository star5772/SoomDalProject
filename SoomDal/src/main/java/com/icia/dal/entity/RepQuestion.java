package com.icia.dal.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class RepQuestion {
	private String dEmail;
	private String firstQ;
	private String secoendQ;
	private String thirdQ;
	private String fourthQ;
}
