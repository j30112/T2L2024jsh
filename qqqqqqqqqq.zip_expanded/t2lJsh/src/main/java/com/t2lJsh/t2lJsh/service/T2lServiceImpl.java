package com.t2lJsh.t2lJsh.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.t2lJsh.t2lJsh.dao.T2lDao;
import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
import com.t2lJsh.t2lJsh.dto.Result_info;
import com.t2lJsh.t2lJsh.dto.Wish_req;

import com.t2lJsh.t2lJsh.dto.Work_perform;
import com.t2lJsh.t2lJsh.dto.Wrt_user;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class T2lServiceImpl implements T2lService {

	private final T2lDao dao;

//	@Override
//	public String test2() {
//		String test = dao.test();
//		return test;
//	}

	@Override
	public String quaterPeriod(String gubun, LocalDate localdate) {
		
		System.out.println("T2lService quaterPeriod start...");
		
		int year = 0;
		String bangi = "";
		LocalDate now = LocalDate.now();
		
		//min이라는 값이 들어오면 현재 날짜에서 상/하반기 구분
		if(gubun.equals("min")) {
			bangi = bangiGubun(now);
		}
		else if (gubun.equals("insertMin")) {
			bangi = bangiGubun(localdate);
		}
		else if (gubun.equals("insertMax")) {
			localdate.plusMonths(6);
			bangi = bangiGubun(localdate);
		}
		// min이 아닌 경우 현재 날짜에서 6개월을 더해 년도와 하/상반기 값 가져오기
		else {
			LocalDate sixMonthAfter = now.plusMonths(6);
			bangi = bangiGubun(sixMonthAfter);
			
		}
		
		return bangi;
	}

	private String bangiGubun(LocalDate now) {
		System.out.printf("T2lService bangiGubun start... \n now = %s", now);
		
		String bangi = "";
		int month = now.getMonthValue();
		int year = now.getYear();
		System.out.println("T2lService bangiGubun >> month = " + month + " year = " + year );
		
		if (month <= 6) {
			bangi = year+"년도 하반기";
			
		}
		else {
			bangi = year+"년도 상반기";
		}
		
		System.out.println("T2lService bangiGubun bangi >> "+bangi);
		
		return bangi;
	}

//	@Override
//	public int insertWrtUser(Wrt_user wrtUser) {
//		System.out.printf("T2lService insertWrtUser start...");
//		int result = 0;
//		
//		System.out.println("T2lService insertWrtUser >> "+wrtUser);
//		
//		result = dao.insertWrtUser(wrtUser);
//		
//		return result;
//	}
	
	
	@Transactional
	@Override
	public int insertValue(Wrt_user wrtUser, Assessmt assessmt, Opinion opinion, Wish_req wishReq,Work_perform workPerform
			) {
		
		int result = 0;
		int docno = 0;
		
		
		System.out.println("T2lService insertValue start...");
		
		//wrt_user 테이블 insert
		System.out.printf("T2lService insertValue insertWrtUser start...");
		result = dao.insertWrtUser(wrtUser);
		System.out.printf("T2lService insertValue insertWrtUser result >> "+result);
		result = 0;
		
		//wrt_user insert하면서 생긴 시퀀스값 가져오기 (mariaDB에는 currentval없음)
		docno = dao.selectDocNo();
		//docno 각 매퍼에 세팅
		assessmt.setDoc_no(docno);
		opinion.setDoc_no(docno);
		wishReq.setDoc_no(docno);
		workPerform.setDoc_no(docno);
		
		
		//workPerform 테이블 insert
		System.out.printf("T2lService insertValue insertWorkPerform start...");
		
		//버퍼에 저장할 변수값 선언
		String seNoInsert;
		String ctgryNoInsert;
		int ajmtRtNoInsert;
		String prfmncCnInsert;
		
		for(int i=0; i<workPerform.getSe_no().size(); i++) {
			//seNoInsert = workPerform.getSe_no()[i];
			seNoInsert = workPerform.getSe_no().get(i);
			ctgryNoInsert = workPerform.getCtgry_no().get(i);
			ajmtRtNoInsert = workPerform.getAjmt_rt().get(i);
			prfmncCnInsert = workPerform.getPrfmnc_cn().get(i);
			
			System.out.println("seNoInsert"+i+" >> "+seNoInsert);
			System.out.println("ctgryNoInsert"+i+" >> "+ctgryNoInsert);
			System.out.println("ajmtRtNoInsert"+i+" >> "+ajmtRtNoInsert);
			System.out.println("prfmncCnInsert"+i+" >> "+prfmncCnInsert);
			
			workPerform.setSe_no_insert(seNoInsert);
			workPerform.setCtgry_no_insert(ctgryNoInsert);
			workPerform.setAjmt_rt_no_insert(ajmtRtNoInsert);
			workPerform.setPrfmnc_cn_insert(prfmncCnInsert);
			
			result = dao.insertWorkPerform(workPerform);
			System.out.printf("T2lService insertValue insertWorkPerform result >> "+result);
			result = 0;
		}
		
		//result = dao.insertWorkPerform(workPerform);
		System.out.printf("T2lService insertValue insertWorkPerform result >> "+result);
		result = 0;
		
		
		
		
		//wish_req 테이블 insert
		System.out.printf("T2lService insertValue insertWishReq start...");
		result = dao.insertWishReq(wishReq);
		System.out.printf("T2lService insertValue insertWishReq result >> "+result);
		result = 0;
		
		//assessmt 테이블 insert
		System.out.println("T2lService insertValue insertAssessmt start...");
		result = dao.insertAssessmt(assessmt);
		System.out.println("T2lService insertValue insertAssessmt result >> "+result);
		result = 0;
		
		//opinion 테이블 insert
		System.out.println("T2lService insertValue insertOpinion start...");
		result = dao.insertOpinion(opinion);
		System.out.println("T2lService insertValue insertOpinion result >> "+result);
		
		
		return result;
	}

	//결과화면에 값 세팅
	@Override
	public Result_info selectResult(int docNo) {
		System.out.println("T2lService selectResult start...");
		
		Result_info resultInfo = new Result_info();
		List<Result_info> resultList = null;
		//wrt_user, wish_req, opinion 테이블에서 전체값 가져옴
		resultList = dao.selectResult(docNo , resultInfo);
		
		
		 if (resultList != null && !resultList.isEmpty()) {
		        // 첫 번째 데이터를 resultInfo에 할당
		        resultInfo = resultList.get(0);

		        // 필요하면 전체 데이터를 순회하여 추가 로직 처리 가능
		        for (Result_info info : resultList) {
		            // 추가적인 데이터 처리 로직
		            System.out.println("Processing: " + info);
		        }
		    } else {
		        System.out.println("No data found for docNo: " + docNo);
		    }

		    System.out.println("resultInfo populated: " + resultInfo);
		
		
		
		//System.out.println("11111111111111********************resultInfo >> " + resultInfo);
		
		
		//Assessment가져오기
		Assessmt assessDto = new Assessmt();
		List<Assessmt> assessmt = null;
		
		for(int gubun=1; gubun<5; gubun++) {
			//System.out.println("T2lService assessmtList gubun >> "+ gubun);
			
			assessmt = dao.assessmtList(docNo, gubun);
			//System.out.println("55555555555555555555555555555555555 assessmt >> "+assessmt);
			
			
			// 데이터가 없는 경우 건너뛰기
		    if (assessmt.isEmpty()) {
		        System.out.println("No data found for gubun: " + gubun);
		        continue;
		    }

		    // assessmt 리스트에서 첫 번째 데이터를 assessDto에 세팅
		    assessDto = assessmt.get(0); // 필요하면 전체 데이터를 순회하여 처리 가능
		    System.out.println("Selected AssessDto: " + assessDto);
		    
			
			switch(gubun) {
		    case 1: /*업무능력평가 자기평가 dto 세팅*/
		    		resultInfo.setUpmuJagiQitem_no1(assessDto.getQitem_no1());
			    	resultInfo.setUpmuJagiQitem_no2(assessDto.getQitem_no2());
			    	resultInfo.setUpmuJagiQitem_no3(assessDto.getQitem_no3());
			    	resultInfo.setUpmuJagiQitem_no4(assessDto.getQitem_no4());
			    	resultInfo.setUpmuJagiQitem_no5(assessDto.getQitem_no5());
			    	resultInfo.setUpmuJagiQitem_no6(assessDto.getQitem_no6());
			    	resultInfo.setUpmuJagiQitem_no7(assessDto.getQitem_no7());
			    	resultInfo.setUpmuJagiQitem_no8(assessDto.getQitem_no8());
			    	resultInfo.setUpmuJagiQitem_no9(assessDto.getQitem_no9());
			    	resultInfo.setUpmuJagiQitem_no10(assessDto.getQitem_no10());
			    	resultInfo.setSum_scr_ab(assessDto.getSum_scr_ab());
			    	//resultInfo.setSe_no(assessDto.getSe_no());
			    	resultInfo.setSum_scr_b(assessDto.getSum_scr_b());
			    	//System.out.println("222222222222222222222222222********************resultInfo >> " + resultInfo);
			    	//System.out.println("333333333333333333333333333********************assessDto >> " + assessDto);
		         	break;
		    case 2:	/*업무능력평가 1차 평가자 dto 세팅*/
			    	resultInfo.setUpmulchaQitem_no1(assessDto.getQitem_no1());
			    	resultInfo.setUpmulchaQitem_no2(assessDto.getQitem_no2());
			    	resultInfo.setUpmulchaQitem_no3(assessDto.getQitem_no3());
			    	resultInfo.setUpmulchaQitem_no4(assessDto.getQitem_no4());
			    	resultInfo.setUpmulchaQitem_no5(assessDto.getQitem_no5());
			    	resultInfo.setUpmulchaQitem_no6(assessDto.getQitem_no6());
			    	resultInfo.setUpmulchaQitem_no7(assessDto.getQitem_no7());
			    	resultInfo.setUpmulchaQitem_no8(assessDto.getQitem_no8());
			    	resultInfo.setUpmulchaQitem_no9(assessDto.getQitem_no9());
			    	resultInfo.setUpmulchaQitem_no10(assessDto.getQitem_no10());
			    	//System.out.println("666666666666666666666666666********************resultInfo >> " + resultInfo);
			    	//System.out.println("777777777777777777777777777********************assessDto >> " + assessDto);
		    		break;
		    case 3: /*기술평가 자기평가 dto 세팅*/
			    	resultInfo.setGisulJagiQitem_no1(assessDto.getQitem_no1());
			    	resultInfo.setGisulJagiQitem_no2(assessDto.getQitem_no2());
		    		resultInfo.setGisulJagiQitem_no3(assessDto.getQitem_no3());
		    		resultInfo.setGisulJagiQitem_no4(assessDto.getQitem_no4());
		    		resultInfo.setGisulJagiQitem_no5(assessDto.getQitem_no5());
		    		resultInfo.setGisulJagiQitem_no6(assessDto.getQitem_no6());
		    		resultInfo.setGisulJagiQitem_no7(assessDto.getQitem_no7());
		    		resultInfo.setGisulJagiQitem_no8(assessDto.getQitem_no8());
		    		resultInfo.setGisulJagiQitem_no9(assessDto.getQitem_no9());
		    		//System.out.println("8888888888888888888888888888********************resultInfo >> " + resultInfo);
		    		break;
		    case 4: /*기술평가 평가자들 dto 세팅*/
			    	resultInfo.setGisulPyeonggaQitem_no1(assessDto.getQitem_no1());
			    	resultInfo.setGisulPyeonggaQitem_no2(assessDto.getQitem_no2());
			    	resultInfo.setGisulPyeonggaQitem_no3(assessDto.getQitem_no3());
			    	resultInfo.setGisulPyeonggaQitem_no4(assessDto.getQitem_no4());
			    	resultInfo.setGisulPyeonggaQitem_no5(assessDto.getQitem_no5());
			    	resultInfo.setGisulPyeonggaQitem_no6(assessDto.getQitem_no6());
			    	resultInfo.setGisulPyeonggaQitem_no7(assessDto.getQitem_no7());
			    	resultInfo.setGisulPyeonggaQitem_no8(assessDto.getQitem_no8());
			    	resultInfo.setGisulPyeonggaQitem_no9(assessDto.getQitem_no9());
			    	//System.out.println("9999999999999999999999999999********************resultInfo >> " + resultInfo);
		    		break;
		    		
			}
			System.out.println("T2lService assessmtList resultInfo >> "+resultInfo);
		}
		
		return resultInfo;
		
	}
		
		


	@Override
	public List<Work_perform> workPergormLIst(int docNo) {
		List<Work_perform> result = dao.workPergormLIst(docNo);
		
		System.out.println("T2lService workPergormLIst List<Result_info> result >> "+result);
		
		return result;
	}

	

}
