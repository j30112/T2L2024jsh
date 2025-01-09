package com.t2lJsh.t2lJsh.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Result_info {
	private String se_no; // VARCHAR(20), VARCHAR(100)
    private String evltr_nm; // VARCHAR(50)
    private int doc_no; // INT(11)
    /*private int qitem_no1; // INT(11)
    private int qitem_no2; // INT(11)
    private int qitem_no3; // INT(11)
    private int qitem_no4; // INT(11)
    private int qitem_no5; // INT(11)
    private int qitem_no6; // INT(11)
    private int qitem_no7; // INT(11)
    private int qitem_no8; // INT(11)
    private int qitem_no9; // INT(11)
    private int qitem_no10; // INT(11)*/
    private int sum_scr_b; // INT(11)
    private String evltr_nm1; // VARCHAR(50)
    private String evl_cn1; // VARCHAR(2000)
    private String evl_rslt_cn1; // CHAR(1)
    private String evl_cn_ceo; // VARCHAR(2000)
    private String evl_rslt_cn_ceo; // CHAR(1)
    private String dmnd_mttr; // VARCHAR(2000)
    //private String ctgry_nm; // VARCHAR(100)
    //private int ajmt_rt; // INT(11)
    //private String prfmnc_cn; // VARCHAR(3000)
    //private int sum_scr_a; // INT(11)
    private String jbgd_nm; // VARCHAR(50)
    private String wrt_nm; // VARCHAR(50)
    private Date wrt_tm; // CHAR(19)
    private int	sum_scr_ab;	//점수 합계 AB
    
    
    
    
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
    
    private int upmulchaQitem_no1; // INT(11) //업무능력 평가 1차평가
    private int upmulchaQitem_no2; // INT(11)
    private int upmulchaQitem_no3; // INT(11)
    private int upmulchaQitem_no4; // INT(11)
    private int upmulchaQitem_no5; // INT(11)
    private int upmulchaQitem_no6; // INT(11)
    private int upmulchaQitem_no7; // INT(11)
    private int upmulchaQitem_no8; // INT(11)
    private int upmulchaQitem_no9; // INT(11)
    private int upmulchaQitem_no10; // INT(11)
    
    
    private int gisulJagiQitem_no1; // INT(11) //기술평가 자기평가
    private int gisulJagiQitem_no2; // INT(11)
    private int gisulJagiQitem_no3; // INT(11)
    private int gisulJagiQitem_no4; // INT(11)
    private int gisulJagiQitem_no5; // INT(11)
    private int gisulJagiQitem_no6; // INT(11)
    private int gisulJagiQitem_no7; // INT(11)
    private int gisulJagiQitem_no8; // INT(11)
    private int gisulJagiQitem_no9; // INT(11)
    
    
    private int gisulPyeonggaQitem_no1; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no2; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no3; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no4; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no5; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no6; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no7; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no8; // INT(11) //기술평가 평가자들
    private int gisulPyeonggaQitem_no9; // INT(11) //기술평가 평가자들
    
    
    
    
    
    
    
}
