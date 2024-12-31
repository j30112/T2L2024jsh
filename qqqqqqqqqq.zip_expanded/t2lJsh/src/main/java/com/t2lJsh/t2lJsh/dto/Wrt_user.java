package com.t2lJsh.t2lJsh.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Wrt_user {
	private int		doc_no;		//평가서 번호
	private String 	jbgd_nm;//직위
	private String 	wrt_nm;	//이름
	private Date 	wrt_tm;	//제출시간
}
