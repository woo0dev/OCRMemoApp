package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CSController1 {
	
	@RequestMapping("doA")
	private void doA() {
		System.out.print("DoA Called");
	}
	
	@RequestMapping("doB")
	private void doB() {
		System.out.print("DoB Called");
	}
	
}
