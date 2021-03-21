package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inhatc.domain.ProductVO;

@Controller
public class CSController5 { // Controller 선
	
	@RequestMapping("doJSON") // Mapping
	private @ResponseBody ProductVO doJSON() { // body 내용으로 mapping
		System.out.println("DoJSOM Called"); // 출력 
		
		ProductVO product = new ProductVO("상품1", 10000.0); // return할 class
		
		return product; // class return
	}
	
}