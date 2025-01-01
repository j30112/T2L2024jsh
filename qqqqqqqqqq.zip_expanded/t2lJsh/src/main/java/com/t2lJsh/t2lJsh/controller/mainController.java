package com.t2lJsh.t2lJsh.controller;
//매퍼 주소 이거 제발 제발 외우라고

import java.lang.reflect.Array;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
import com.t2lJsh.t2lJsh.dto.Test01;
import com.t2lJsh.t2lJsh.dto.Wish_req;
import com.t2lJsh.t2lJsh.dto.Work_perform;
import com.t2lJsh.t2lJsh.dto.Wrt_user;
import com.t2lJsh.t2lJsh.service.T2lService;
import com.t2lJsh.t2lJsh.service.mainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequiredArgsConstructor
@Slf4j
public class mainController {
	
	private final mainService ms;
	private final T2lService service;
	
	
	
	 /*@GetMapping(value="/") 
	 public String test(Model model) {
	 System.out.println("컨트롤러옴");
	  
	 //Test01 test = ms.test();
	  
	 //String test = service.test2();
	  
	 //System.out.println(test+"2222222222222222222222");
	  
	 //model.addAttribute("test",test); 
	 return "test01"; 
	 }
	 */
	 
	
	
	//평가 메인 화면 컨트롤러
	@GetMapping(value = "/")
	public String main(Model model) {
		System.out.println("mainController main start...");
		
		//현재 날짜 기준으로 년도, 상/하반기 구분 가져오기
		String quaterInfoNow = service.quaterPeriod("min");
		String quaterInfoNext = service.quaterPeriod("max");
		
		System.out.println("mainController main quaterInfoNow >> "+quaterInfoNow);
		System.out.println("mainController main quaterInfoNext >> "+quaterInfoNext);
		
		model.addAttribute("quaterInfoNow",quaterInfoNow);
		model.addAttribute("quaterInfoNext",quaterInfoNext);
		
		return "mainTest";
//		return "test01"; 
	}
	
	//*******카테고리 추가 로직 완성 못함 
	//사용자가 평가서 제출
	@GetMapping("/formSubmit")
	public String formSubmit(/*@RequestParam String param*/
								@ModelAttribute Wrt_user wrtUser
								,@ModelAttribute Assessmt assessmt
								,@ModelAttribute Opinion opinion
								,@ModelAttribute Wish_req wishReq
								,@ModelAttribute Work_perform workPerform
								/*,@RequestParam("se_no[]") String[] senoArray		/*자꾸 list에러나서 결국 배열로 사용함 하......
								,@RequestParam("ctgry_no[]") String[] ctgryNoArray
							    ,@RequestParam("ajmt_rt[]") String[] ajmtRtArray
							    ,@RequestParam("prfmnc_cn[]") String[] prfmncCnArray*/
							) {
		
		System.out.println("mainController formSubmit start...");
		log.info("mainController formSubmit start...", LocalDateTime.now());
		
		System.out.println("배열학인 >> " + workPerform);
		/*System.out.println("배열학인 >> " + Arrays.toString(ctgryNoArray));
		System.out.println("배열학인 >> " + Arrays.toString(ajmtRtArray));
		System.out.println("배열학인 >> " + Arrays.toString(prfmncCnArray));*/
		
		
		
		
		int result =0;
		
		result = service.insertValue(
									wrtUser, assessmt, opinion, wishReq, workPerform
									);
		
		
		
		return "/";
	}
	

}
