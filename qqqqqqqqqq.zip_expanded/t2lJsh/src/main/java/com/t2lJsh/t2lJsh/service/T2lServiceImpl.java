package com.t2lJsh.t2lJsh.service;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.t2lJsh.t2lJsh.dao.T2lDao;
import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
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
	public String quaterPeriod(String gubun) {
		
		System.out.println("T2lService quaterPeriod start...");
		
		int year = 0;
		String bangi = "";
		LocalDate now = LocalDate.now();
		
		//min이라는 값이 들어오면 현재 날짜에서 상/하반기 구분
		if(gubun.equals("min")) {
			bangi = bangiGubun(now);
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
	public int insertValue(Wrt_user wrtUser, Assessmt assessmt, Opinion opinion, Wish_req wishReq,
			Work_perform workPerform) {
		
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
		
		
		//*******카테고리 추가 로직 완성 못함 
		//workPerform 테이블 insert
		System.out.printf("T2lService insertValue insertWorkPerform start...");
		result = dao.insertWorkPerform(workPerform);
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
	


}
