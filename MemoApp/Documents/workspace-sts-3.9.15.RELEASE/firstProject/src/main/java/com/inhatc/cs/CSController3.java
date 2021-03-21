package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inhatc.domain.ProductVO;

@Controller
public class CSController3 {
	
	@RequestMapping("doD")
	private String doD( Model model) {
		System.out.println("DoD Called");
		
		ProductVO product = new ProductVO("상품1", 10000.0);
		
		model.addAttribute(product);
		
		return "productDetail";
	}
	
}
