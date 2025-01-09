package com.t2lJsh.t2lJsh.dto;

import lombok.Data;

@Data
public class Assessmt {
	private String	se_no;		//평가 구분번호
	private String	EVLTR_NM;	//평가자명
	private int		doc_no;		//평가서 번호
	private int		qitem_no1;	//문항1 답변
	private int		qitem_no2;	//문항2 답변
	private int		qitem_no3;	//문항3 답변
	private int		qitem_no4;	//문항4 답변
	private int		qitem_no5;	//문항5 답변
	private int		qitem_no6;	//문항6 답변
	private int		qitem_no7;	//문항7 답변
	private int		qitem_no8;	//문항8 답변
	private int		qitem_no9;	//문항9 답변
	private int		qitem_no10;	//문항10 답변
	private int		sum_scr_b;	//점수 합계
	private int		sum_scr_ab;	//점수 합계 AB
	
	
	////////////버퍼용
	
	private int qItemNo1;//업무능력평가 자기평가1
	private int qItemNo2;//업무능력평가 자기평가2
	private int qItemNo3;//업무능력평가 자기평가3
	private int qItemNo4;//업무능력평가 자기평가4
	private int qItemNo5;//업무능력평가 자기평가5
	private int qItemNo6;//업무능력평가 자기평가6
	private int qItemNo7;//업무능력평가 자기평가7
	private int qItemNo8;//업무능력평가 자기평가8
	private int qItemNo9;//업무능력평가 자기평가9
	private int qItemNo10;//업무능력평가 자기평가10
	
	private int ilChaQItemNo1; //업무능력평가 1차 평가자
	private int ilChaQItemNo2; //업무능력평가 1차 평가자
	private int ilChaQItemNo3; //업무능력평가 1차 평가자
	private int ilChaQItemNo4; //업무능력평가 1차 평가자
	private int ilChaQItemNo5; //업무능력평가 1차 평가자
	private int ilChaQItemNo6; //업무능력평가 1차 평가자
	private int ilChaQItemNo7; //업무능력평가 1차 평가자
	private int ilChaQItemNo8; //업무능력평가 1차 평가자
	private int ilChaQItemNo9; //업무능력평가 1차 평가자
	private int ilChaQItemNo10; //업무능력평가 1차 평가자
	
	private int twoQItemNo1;	//기술적 성취 자기 평가
	private int twoQItemNo2;	//기술적 성취 자기 평가
	private int twoQItemNo3;	//기술적 성취 자기 평가
	private int twoQItemNo4;	//기술적 성취 자기 평가
	private int twoQItemNo5;	//기술적 성취 자기 평가
	private int twoQItemNo6;	//기술적 성취 자기 평가
	private int twoQItemNo7;	//기술적 성취 자기 평가
	private int twoQItemNo8;	//기술적 성취 자기 평가
	private int twoQItemNo9;	//기술적 성취 자기 평가
	
	private int twoChaQItemNo1;	//기술적 성취 2차 평가자 
	private int twoChaQItemNo2;	//기술적 성취 2차 평가자
	private int twoChaQItemNo3;	//기술적 성취 3차 평가자
	private int twoChaQItemNo4;	//기술적 성취 3차 평가자
	private int twoChaQItemNo5;	//기술적 성취 4차 평가자
	private int twoChaQItemNo6;	//기술적 성취 4차 평가자
	private int twoChaQItemNo7;	//기술적 성취 5차 평가자
	private int twoChaQItemNo8;	//기술적 성취 5차 평가자
	private int twoChaQItemNo9;	//기술적 성취 6차 평가자
	
	
	
	
	//버퍼 저장용 (이건 select..... 뭔가 이름 꼬일까봐 그냥 새로 만듦...)
    private int upmuJagiQitem_no1; // INT(11) //업무능력 평가 자기평가
    private int upmuJagiQitem_no2; // INT(11)
    private int upmuJagiQitem_no3; // INT(11)
    private int upmuJagiQitem_no4; // INT(11)
    private int upmuJagiQitem_no5; // INT(11)
    private int upmuJagiQitem_no6; // INT(11)
    private int upmuJagiQitem_no7; // INT(11)
    private int upmuJagiQitem_no8; // INT(11)
    private int upmuJagiQitem_no9; // INT(11)
    private int upmuJagiQitem_no10; // INT(11)
    
//    private int upmulchaQitem_no1; // INT(11) //업무능력 평가 1차평가
//    private int upmulchaQitem_no2; // INT(11)
//    private int upmulchaQitem_no3; // INT(11)
//    private int upmulchaQitem_no4; // INT(11)
//    private int upmulchaQitem_no5; // INT(11)
//    private int upmulchaQitem_no6; // INT(11)
//    private int upmulchaQitem_no7; // INT(11)
//    private int upmulchaQitem_no8; // INT(11)
//    private int upmulchaQitem_no9; // INT(11)
//    private int upmulchaQitem_no10; // INT(11)
//    
//    
//    private int gisulJagiQitem_no1; // INT(11) //기술평가 자기평가
//    private int gisulJagiQitem_no2; // INT(11)
//    private int gisulJagiQitem_no3; // INT(11)
//    private int gisulJagiQitem_no4; // INT(11)
//    private int gisulJagiQitem_no5; // INT(11)
//    private int gisulJagiQitem_no6; // INT(11)
//    private int gisulJagiQitem_no7; // INT(11)
//    private int gisulJagiQitem_no8; // INT(11)
//    private int gisulJagiQitem_no9; // INT(11)
//    
//    
//    private int gisulPyeonggaQitem_no1; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no2; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no3; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no4; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no5; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no6; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no7; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no8; // INT(11) //기술평가 평가자들
//    private int gisulPyeonggaQitem_no9; // INT(11) //기술평가 평가자들
}
