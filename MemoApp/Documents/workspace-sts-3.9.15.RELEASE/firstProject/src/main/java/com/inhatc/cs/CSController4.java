package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CSController4 {
	
	@RequestMapping("doE")
	private String doE( RedirectAttributes rttr) {
		System.out.println("DoE Called");
		
		rttr.addFlashAttribute("msg", "그냥");
		return "redirect:/doF";
	}
	
	@RequestMapping("doF")
	private String doF( @ModelAttribute("msg") String msg) {
		System.out.println("DoF Called");
		System.out.println(msg);
		
		return "doF";
	}
	
}