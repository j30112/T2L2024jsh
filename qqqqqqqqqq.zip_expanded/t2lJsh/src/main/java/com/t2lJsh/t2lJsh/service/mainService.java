package com.t2lJsh.t2lJsh.service;

import org.springframework.stereotype.Service;

import com.t2lJsh.t2lJsh.dao.mainDao;
import com.t2lJsh.t2lJsh.dto.Test01;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class mainService {

	private final mainDao md;
	
	public   Test01 test() {
		System.out.println("서비스까지옴");
		Test01 test = md.test();
		
		return test;
		
	}
}
