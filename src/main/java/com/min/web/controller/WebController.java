package com.min.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/taiji/view")
public class WebController {
	
    @RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(){
		return "main";
	}

	@RequestMapping(value = "article/list", method = RequestMethod.GET)
	public String article(){
	    return "article/list";
	}
	
	@RequestMapping(value = "article/write", method = RequestMethod.GET)
	public String write(){
		return "article/write";
	}

	@RequestMapping(value = "question", method = RequestMethod.GET)
	public String question(){
	    return "question";
	}
}
