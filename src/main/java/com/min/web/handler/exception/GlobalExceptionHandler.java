package com.min.web.handler.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.min.web.handler.exception.support.DomainNullPointSupport;
import com.min.web.handler.exception.vo.ErrorVO;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = NullPointerException.class)
	public @ResponseBody ErrorVO nullpointHandler(DomainNullPointSupport exception, HttpServletRequest req){
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		ErrorVO errorVO = new ErrorVO();
		errorVO.setCode(status.value());
		errorVO.setStatus(status.ordinal());
		errorVO.setMessage(exception.getLocalizedMessage());
		errorVO.setCustomMessage(exception.getSeq() + "th column in " + exception.getDomainName() +  " domain is Empty");
		errorVO.setMoreInfo("request URL : " + req.getRequestURL());
		return errorVO; 
	}
}
