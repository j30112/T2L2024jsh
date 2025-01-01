package com.t2lJsh.t2lJsh.dto;

import java.util.List;

import lombok.Data;

@Data
public class Opinion {
	private int		doc_no;		//평가서 번호
	private String 	evltr_nm1;		//1차 평가자 이름
	private String 	evl_cn1;			//1차 평가자 평가 내용
	private String 	evl_rslt_cn1;	//1차 평가자 평가 등급
	private String 	evl_cn_ceo;		//대표이사 평가 내용
	private String 	evl_rslt_cn_ceo;	//대표이사 평가 등급
}
