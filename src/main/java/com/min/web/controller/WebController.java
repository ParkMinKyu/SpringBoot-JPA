package com.min.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/taiji/view")
public class WebController {
	
    @RequestMapping("main")
	public String main(){
		return "main";
	}

	@RequestMapping("article")
	public String article(){
	    return "article";
	}

	@RequestMapping("question")
	public String question(){
	    return "question";
	}
}
