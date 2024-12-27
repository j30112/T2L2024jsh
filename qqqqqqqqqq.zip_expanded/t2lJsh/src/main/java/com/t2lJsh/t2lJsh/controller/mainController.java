package com.t2lJsh.t2lJsh.controller;
//매퍼 주소 이거 제발 제발 외우라고

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.t2lJsh.t2lJsh.dto.Test01;
import com.t2lJsh.t2lJsh.service.T2lService;
import com.t2lJsh.t2lJsh.service.mainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class mainController {
	
	private final mainService ms;
	private final T2lService service;
	
	
	@GetMapping(value="/")
	public String test(Model model) {
		System.out.println("컨트롤러옴");
		
		//Test01 test = ms.test();
		
		String test = service.test2();
		
		System.out.println(test+"2222222222222222222222");
		
		model.addAttribute("test",test);
		return "test01";
	}

}
