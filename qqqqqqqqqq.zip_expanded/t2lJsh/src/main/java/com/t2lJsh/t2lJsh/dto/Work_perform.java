package com.t2lJsh.t2lJsh.dto;

import lombok.Data;

@Data
public class Work_perform {
	String 	se_no;		//글 작성란 구분번호
	String 	doc_no;		//평가서 번호
	String 	ctgry_no;	//카테고리명
	int 	ajmt_rt;	//달성률
	String 	prfmnc_cn;	//내용
	int 	sum_scr_a;	//업무 성과점수
}
