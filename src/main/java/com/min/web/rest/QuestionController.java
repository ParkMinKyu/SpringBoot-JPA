package com.min.web.rest;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.min.web.service.cache.QuestionCache;


@RestController
@RequestMapping("/taiji/question")
public class QuestionController {
	
	@Autowired
	private QuestionCache questionCache;
	
	@RequestMapping(value = "{num}", method = RequestMethod.GET)
	public ResponseEntity<?> getQuestion(@PathVariable(value="num")long num,HttpServletRequest req){
		return new ResponseEntity<>(questionCache.getQuestion(num),HttpStatus.OK);
	}
	
}
