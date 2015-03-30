package com.min.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(){
		return "redirect:/taiji/view/main";
	}
}
