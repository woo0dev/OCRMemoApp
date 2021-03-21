package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CSController2 {
	
	@RequestMapping("doC")
	private String doC( @ModelAttribute("msg") String msg) {
		System.out.println("DoC Called");
		System.out.println(msg);
		
		return "doD";
	}
	
}
