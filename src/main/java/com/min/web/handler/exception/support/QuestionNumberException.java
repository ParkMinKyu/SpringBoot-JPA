package com.min.web.handler.exception.support;

import lombok.Getter;

public class QuestionNumberException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	@Getter
	private long num;

	public QuestionNumberException(long num){
		this.num = num;
	}
	
}
