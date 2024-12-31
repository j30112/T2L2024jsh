package com.t2lJsh.t2lJsh.service;

import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
import com.t2lJsh.t2lJsh.dto.Wish_req;
import com.t2lJsh.t2lJsh.dto.Work_perform;
import com.t2lJsh.t2lJsh.dto.Wrt_user;

public interface T2lService {

	/* String test2(); */

	String quaterPeriod(String string);

	int insertValue(Wrt_user wrtUser, Assessmt assessmt, Opinion opinion, Wish_req wishReq, Work_perform workPerform);

}
