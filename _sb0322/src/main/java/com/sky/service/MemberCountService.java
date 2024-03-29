package com.sky.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sky.dao.MemberDao;
import com.sky.dto.Member;


@Service
public class MemberCountService {
	
	@Autowired
	private MemberDao memberDao;
	
	public int count() {
		return memberDao.count();
	}
	
	public List<Member> selectAll() {
		return memberDao.selectAll();
	}
	
	public Member selectByEmail(String email) {
		return memberDao.selectByEmail(email);
	}
	
	public void insert(Member member) {
		memberDao.insert(member);
	}
	
	public void update(Member member) {
		memberDao.update(member);
	}
	
	public void delete(int id) {
		memberDao.delete(id);
		
	}
	
	
}
