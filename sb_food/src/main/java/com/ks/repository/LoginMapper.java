package com.ks.repository;

import org.apache.ibatis.annotations.Mapper;

import com.ks.dto.Member;

@Mapper
public interface LoginMapper {
	
	int selectCount();
	Member selectForLogin(String id, String pw);
	Member selectById(String id);
}
