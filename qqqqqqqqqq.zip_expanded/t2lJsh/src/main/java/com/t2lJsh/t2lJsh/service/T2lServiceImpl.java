package com.t2lJsh.t2lJsh.service;

import org.springframework.stereotype.Service;

import com.t2lJsh.t2lJsh.dao.T2lDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class T2lServiceImpl implements T2lService {

	private final T2lDao dao;
	
	@Override
	public String test2() {
		String test = dao.test();
		return test;
	}

}