package com.icia.dal.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DetailField {
	private String fNo;
	private String detailFName;
	private String detailFSajin;
}
