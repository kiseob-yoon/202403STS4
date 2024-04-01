package com.ks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ks.dto.Member;
import com.ks.repository.LoginMapper;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	public int selectCount() {
		return loginMapper.selectCount();
	}
	public Member selectForLogin(String id, String pw) {
		return loginMapper.selectForLogin(id, pw);
	}
	public Member selectById(String id) {
		return loginMapper.selectById(id);
	}
	
	
	
}
