package com.min.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "img/list/{imgGroup}", method = RequestMethod.GET)
	public String imgList(@PathVariable("imgGroup")long imgGroup,Model model){
	    model.addAttribute("imgGroup", imgGroup);
	    return "img/list";
	}

	@RequestMapping(value = "img/write/{imgGroup}", method = RequestMethod.GET)
	public String imgWrite(@PathVariable("imgGroup")long imgGroup,Model model){
		model.addAttribute("imgGroup", imgGroup);
		return "img/write";
	}

}
