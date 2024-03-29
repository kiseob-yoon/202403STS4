package com.ks.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ks.spring.Member;

@Mapper
public interface MemberMapper {
	int selectCount();
	
	@Select("select count(*) from member")
	int count();
	
	@Select("select * from MEMBER where EMAIL = #{email}")
	Member selectByEmail(String email);
	
	@Insert("insert into MEMBER (email, password, name, regdate) " + "values (#{email}, #{password}, #{name}, now())")
	public void insert(Member member);
	
	@Update("update MEMBER set name = #{name}, password = #{password} where email = #{email}")
	public void update(Member member);
	
	@Delete("delete from member where id= #{id}")
	public int delete(int id);
	
	
}
