package com.t2lJsh.t2lJsh.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class T2lDaoImpl implements T2lDao {
	
	private final SqlSession session;
	
	@Override
	public String test() {
		String test  = session.selectOne("com.t2lJsh.t2lJsh.assess.test2");
		return test;
	}

}
