package com.min.web.handler.exception.vo;

import lombok.Data;

@Data
public class ErrorVO {
	private int status;
	private int code;
	private String message;
	private String customMessage;
	private String moreInfo;
}
