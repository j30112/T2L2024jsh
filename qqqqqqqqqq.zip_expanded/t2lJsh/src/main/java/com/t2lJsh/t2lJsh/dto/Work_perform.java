package com.t2lJsh.t2lJsh.dto;


import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// data어노테이션 사용 후 dto에 list 변수를 추가하면 에러가 생겨서 하나하나 게터, 세터로 설정
@Getter
@Setter
@ToString
public class Work_perform {
	private List<String> 	se_no;		//글 작성란 구분번호
	private int				doc_no;		//평가서 번호
	private int 			sum_scr_a;	//업무 성과점수
	private List<String> 	ctgry_no;	//카테고리명
	private List<Integer> 	ajmt_rt;	//달성률
	private List<String> 	prfmnc_cn;	//내용
	
	//버퍼
	private String se_no_insert;		//배열에서 se_no값 가져와 세팅
	private String ctgry_no_insert;		//배열에서 ctgry_no값 가져와 세팅
	private int ajmt_rt_no_insert;		//배열에서 ajmt_rt값 가져와 세팅
	private String prfmnc_cn_insert;	//배열에서 prfmnc_cn값 가져와 세팅
	
	private String 	se_no_select;	//select
	private String 	ctgry_no_select;
	private int 	ajmt_rt_no_select;
	private String 	prfmnc_cn_select;
	
	//gk.............아니 그저께인가에 에러나서 배열로 짜놨는데 이번엔 왜 에러 안나냐.......
	//private List<String> eeeeeee;
	
}
