package com.sky.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.sky.dto.Member;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	public Member selectByEmail(String email) {
		Member results = jdbcTemplate.queryForObject( // queryForObject은 null체크를 못함 따라서 반드시 값이 나오는 것만 사용해야함
				"select * from MEMBER where EMAIL =?", 
				(rs, rowNum)->{
				Member member = new Member(
						rs.getString("NAME"), 
						rs.getInt("AGE"), 
						rs.getString("EMAIL"),
						rs.getString("MEMO"));
				member.setId(rs.getLong("ID"));
				return member;
			}, email);
		return results;
	}
	

	public void insert(Member member) {
	    jdbcTemplate.update("insert into member(name,age,email,memo) values(?,?,?,?)",
	            member.getName(), member.getAge(), member.getEmail(), member.getMemo());
	}

	public void insert2(Member member) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement
						("insert into member(name,age,email,memo)" + "values(?,?,?,?)",
								new String[] {"ID"});
				pstmt.setString(1, member.getName());
				pstmt.setInt(2, member.getAge());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getMemo());
				return pstmt;
			}
		},keyHolder);
		Number keyvalue = keyHolder.getKey();
		member.setId(keyvalue.longValue());
	}

	public void update(Member member) {
		jdbcTemplate.update("update member set name=?,age=?,memo=? where email=?",
				member.getName(),member.getAge(),member.getMemo(),member.getEmail());
	}

	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query( // queryForObject은 null체크를 못함 따라서 반드시 값이 나오는 것만 사용해야함
				"select * from MEMBER", 
				(rs, rowNum)->{
				Member member = new Member(
						rs.getString("NAME"), 
						rs.getInt("AGE"), 
						rs.getString("EMAIL"),
						rs.getString("MEMO"));
				member.setId(rs.getLong("ID"));
				return member;
			});
		return results;
	}
	
	public int count() {
		return jdbcTemplate.queryForObject(
				"select count(*) from member", Integer.class);
		
	}
	
	public void delete(int id) {
		jdbcTemplate.update("delete from member where id=?",id);
	}

}
