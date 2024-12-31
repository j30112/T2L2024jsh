package com.t2lJsh.t2lJsh.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
import com.t2lJsh.t2lJsh.dto.Wish_req;
import com.t2lJsh.t2lJsh.dto.Work_perform;
import com.t2lJsh.t2lJsh.dto.Wrt_user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@RequiredArgsConstructor
public class T2lDaoImpl implements T2lDao {
	
	private final SqlSession session;
	
	@Override
	public String test() {
		String test  = "";
				//session.selectOne("com.t2lJsh.t2lJsh.assess.test2");
		return test;
	}

	@Override
	public int insertWrtUser(Wrt_user wrtUser) {
		System.out.println("T2lDaoImpl insertWrtUser start...");
		System.out.println("T2lDaoImpl insertWrtUser wrtUser >> "+wrtUser);
		
		int result = 0;
		
		try {
			result = session.insert("com.t2lJsh.t2lJsh.wrtUser.insertWrtUser", wrtUser);
		} catch (Exception e) {
			System.out.println("T2lDaoImpl insertWrtUser exception >> "+e);
		}
		return result;
	}
	


	@Override
	public int selectDocNo() {
		System.out.println("T2lDaoImpl selectDocNo start...");
		
		int docNo = 0;
		try {
			docNo = session.selectOne("com.t2lJsh.t2lJsh.wrtUser.selectDocNo");
		} catch (Exception e) {
			System.out.println("T2lDaoImpl selectDocNo exception >> "+e);
		}
		
		System.out.println("T2lDaoImpl selectDocNo docNo >> "+docNo);
		return docNo;
	}


	@Override
	public int insertWorkPerform(Work_perform workPerform) {
		System.out.println("T2lDaoImpl insertWorkPerform start...");
		System.out.println("T2lDaoImpl insertWorkPerform wrtUser >> "+workPerform);
		
		int result = 0;
		
		try {
			result = session.insert("com.t2lJsh.t2lJsh.workperform.insertworkperform", workPerform);
		} catch (Exception e) {
			System.out.println("T2lDaoImpl insertWorkPerform exception >> "+e);
		}
		
		return result;
	}

	@Override
	public int insertWishReq(Wish_req wishReq) {
		System.out.println("T2lDaoImpl insertWishReq start...");
		System.out.println("T2lDaoImpl insertWishReq wishReq >> "+wishReq);
		
		int result = 0;
		
		try {
			result = session.insert("com.t2lJsh.t2lJsh.wishReq.insertWishReq", wishReq);
		} catch (Exception e) {
			System.out.println("T2lDaoImpl insertWishReq exception >> "+e);
		}
		
		return result;
	}

	@Override
	public int insertAssessmt(Assessmt assessmt) {
		System.out.println("T2lDaoImpl insertAssessmt start...");
		System.out.println("T2lDaoImpl insertAssessmt assessmt >> "+assessmt);
		
		int result  = 0;
		
		try {
			//업무능력 자기평가
			result = session.insert("com.t2lJsh.t2lJsh.assessmt.qItemNo101_11",assessmt);
			result = 0;
			//업무능력 1차 평가자
			result = session.insert("com.t2lJsh.t2lJsh.assessmt.qItemNo101_11_1cha",assessmt);
			result = 0;
			//기술적 성취 자기평가
			result = session.insert("com.t2lJsh.t2lJsh.assessmt.qItemNo101_12",assessmt);
			result = 0;
			//기술적 성취 2차 평가자
			//만약 유저테이블을 제대로 만든 경우 거기에서 join문 걸어서 문항 값 가져오는거로 생각하고 mapper하나로 작성하기로 함
			result = session.insert("com.t2lJsh.t2lJsh.assessmt.qItemNo101_12_2cha",assessmt);
			
			
		} catch (Exception e) {
			System.out.println("T2lDaoImpl insertAssessmt exception >> "+e);
		}
		
		return result;
	}

	@Override
	public int insertOpinion(Opinion opinion) {
		System.out.println("T2lDaoImpl insertOpinion start...");
		System.out.println("T2lDaoImpl insertOpinion assessmt >> "+opinion);
		
		int result = 0;
		
		try {
			result = session.insert("com.t2lJsh.t2lJsh.opinion.insertOpinion",opinion);
		} catch (Exception e) {
			System.out.println("T2lDaoImpl insertOpinion exception >> "+e);
		}
		
		return result;
	}
}
