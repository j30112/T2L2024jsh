package com.t2lJsh.t2lJsh.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.t2lJsh.t2lJsh.dto.Test01;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class mainDao {
	
	private final SqlSession session;

	public Test01 test() {
		
		Test01 test = session.selectOne("com.postgre.choongsam.mapper.test.selectTest");
		
		return test;
	}

}
