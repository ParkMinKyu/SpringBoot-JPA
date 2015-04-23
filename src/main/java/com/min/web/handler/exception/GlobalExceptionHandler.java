package com.min.web.handler.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
/*import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.min.web.handler.exception.support.DomainNullPointException;
import com.min.web.handler.exception.support.QuestionNumberException;
import com.min.web.handler.exception.vo.ErrorVO;*/

@ControllerAdvice
public class GlobalExceptionHandler {
	
	/*
	 * TODO : 에러처리 나중에 추가
	 * @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = NullPointerException.class)
	public @ResponseBody ErrorVO nullPointerException(DomainNullPointException exception, HttpServletRequest req){
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		ErrorVO errorVO = new ErrorVO();
		errorVO.setCode(status.value());
		errorVO.setStatus(status.ordinal());
		errorVO.setMessage(exception.getLocalizedMessage());
		errorVO.setCustomMessage(exception.getSeq() + "th column in " + exception.getDomainName() +  " domain is Empty");
		errorVO.setMoreInfo("request URL : " + req.getRequestURL());
		return errorVO; 
	}

	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = RuntimeException.class)
	public @ResponseBody ErrorVO arrayIndexOutOfBoundsException(QuestionNumberException exception, HttpServletRequest req){
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		ErrorVO errorVO = new ErrorVO();
		errorVO.setCode(status.value());
		errorVO.setStatus(status.ordinal());
		errorVO.setMessage(exception.getLocalizedMessage());
		errorVO.setCustomMessage("The Last Question Number is 20, Your Question Number is "+ exception.getNum());
		errorVO.setMoreInfo("request URL : " + req.getRequestURL());
		return errorVO; 
	}
*/
}
