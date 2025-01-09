package com.t2lJsh.t2lJsh.controller;
//매퍼 주소 이거 제발 제발 외우라고

import java.lang.reflect.Array;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
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
import com.t2lJsh.t2lJsh.dto.Result_info;
import com.t2lJsh.t2lJsh.service.T2lService;
import com.t2lJsh.t2lJsh.service.mainService;

import lombok.Data;
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
		String quaterInfoNow = service.quaterPeriod("min", null);
		String quaterInfoNext = service.quaterPeriod("max", null);
		
		System.out.println("mainController main quaterInfoNow >> "+quaterInfoNow);
		System.out.println("mainController main quaterInfoNext >> "+quaterInfoNext);
		
		model.addAttribute("quaterInfoNow",quaterInfoNow);
		model.addAttribute("quaterInfoNext",quaterInfoNext);
		
		return "mainTest";
//		return "test01"; 
	}
	
	//사용자가 평가서 제출
	@GetMapping("/formSubmit")
	public String formSubmit(/*@RequestParam String param*/
								Model model
								,@ModelAttribute Wrt_user wrtUser
								,@ModelAttribute Assessmt assessmt
								,@ModelAttribute Opinion opinion
								,@ModelAttribute Wish_req wishReq
								,@ModelAttribute Work_perform workPerform
								,@ModelAttribute Result_info resultInfo
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
		
		//insert작업
		result = service.insertValue(
									wrtUser, assessmt, opinion, wishReq, workPerform
									);
		
		if (result!=0) {
			
			//평가문항 담을 리스트 생성
			List<Result_info> resultLIst = new ArrayList<>();
			
			int docNo = assessmt.getDoc_no();
			System.out.println("mainController formSubmit select docNo >> "+docNo);
			
			//wrt_user, wish_req, opinion, assessmt 테이블에서 전체값 가져와서 dto에 세팅
			resultInfo = service.selectResult(docNo);
			
			//평가문항 담을 리스트에 resultInfo dto저장
			resultLIst.add(resultInfo);
			
			
			//work_perform 가져와서 각 List에 선언 제발 List보내는건 자체 에러 안 나야 함... 제발제발제ㅏㄹ
			//foreach문으로 처리
			List<Work_perform> workPergormLIst = service.workPergormLIst(docNo);
			
			System.out.println("컨트롤러에 resultInfo 자동매핑 확인 >>" +resultInfo);
			System.out.println("컨트롤러에 workPergormLIst 확인 >>" +workPergormLIst);
			
			//입력자 정보
			String wrt_nm = resultInfo.getWrt_nm(); //이름
			String jbgd_nm = resultInfo.getJbgd_nm(); //직위명
			Date wrtDay = resultInfo.getWrt_tm(); //작성일
			//입력정보 계산
			LocalDate localdate = wrtDay.toLocalDate();
			String insertBangi = service.quaterPeriod("insertMin",localdate);
			String sumBangi = service.quaterPeriod("insertMax",localdate);
			
			
			//업무성과(score A)
			int sum_scr_a = workPerform.getSum_scr_a();
			
			//희망사항
			String dmnd_mttr = resultInfo.getDmnd_mttr();//희망사항
			
			
			//평가자 의견
			String evltr_nm1 = resultInfo.getEvltr_nm1(); //1차 평가자명
			String evl_cn1 = resultInfo.getEvl_cn1(); //1차 평가자 평가 내용
			String evl_rslt_cn1 = resultInfo.getEvl_rslt_cn1(); //1차 평가자 평가 등급
			String evl_cn_ceo = resultInfo.getEvl_cn_ceo(); //대표이사 평가자 평가 내용
			String evl_rslt_cn_ceo = resultInfo.getEvl_rslt_cn_ceo(); //대표이사 평가자 평가 등급
			
			
			model.addAttribute("insertBangi", insertBangi);
			model.addAttribute("sumBangi", sumBangi);
			
			//업무성과 리스트 전송
			model.addAttribute("workPergormLIst", workPergormLIst);
			//입력자 정보
			model.addAttribute("wrt_nm", wrt_nm); //이름
			model.addAttribute("jbgd_nm", jbgd_nm); //직위
			//업무성과(score A)
			model.addAttribute("sum_scr_a", sum_scr_a); //직위
			//희망사항
			model.addAttribute("dmnd_mttr", dmnd_mttr);
			//평가자 의견
			model.addAttribute("evltr_nm1", evltr_nm1); //1차 평가자 이름
			model.addAttribute("evl_cn1", evl_cn1); //1차 평가자 평가 내용
			model.addAttribute("evl_rslt_cn1", evl_rslt_cn1); //1차 평가자 평가 등급
			model.addAttribute("evl_cn_ceo", evl_cn_ceo); //대표이사 평가 내용
			model.addAttribute("evl_rslt_cn_ceo", evl_rslt_cn_ceo); //대표이사 평가 등급
			
			//평가문항 보내기 위한 리스트 전송
			model.addAttribute("resultLIst", resultLIst); //대표이사 평가 등급
			
			
			
			
			
			
			
			
		}
		
		return "resultTest";
	}
	

}
