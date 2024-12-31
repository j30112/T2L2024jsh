package com.t2lJsh.t2lJsh.dao;

import com.t2lJsh.t2lJsh.dto.Assessmt;
import com.t2lJsh.t2lJsh.dto.Opinion;
import com.t2lJsh.t2lJsh.dto.Wish_req;
import com.t2lJsh.t2lJsh.dto.Work_perform;
import com.t2lJsh.t2lJsh.dto.Wrt_user;

public interface T2lDao {

	String test();

	int insertWrtUser(Wrt_user wrtUser);

	int insertWorkPerform(Work_perform workPerform);

	int insertWishReq(Wish_req wishReq);

	int selectDocNo();

	int insertAssessmt(Assessmt assessmt);

	int insertOpinion(Opinion opinion);

}
