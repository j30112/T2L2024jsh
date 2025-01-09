package com.t2lJsh.t2lJsh.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
import com.t2lJsh.t2lJsh.dto.Result_info;
import com.t2lJsh.t2lJsh.dto.Wish_req;
import com.t2lJsh.t2lJsh.dto.Work_perform;
import com.t2lJsh.t2lJsh.dto.Wrt_user;

public interface T2lService {

	/* String test2(); */

	String quaterPeriod(String string, LocalDate localdate);

	int insertValue(Wrt_user wrtUser, Assessmt assessmt, Opinion opinion, Wish_req wishReq, Work_perform workPerform);

	Result_info selectResult(int docNo);

	List<Work_perform> workPergormLIst(int docNo);

	//Result_info assessmtList(int docNo, List<Result_info> workPergormLIst);

}
