package com.icia.dal.Exception;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class JobFailException extends RuntimeException {
	private String message;
	
	@Override
	public String getMessage() {
		return message;
	}
}
