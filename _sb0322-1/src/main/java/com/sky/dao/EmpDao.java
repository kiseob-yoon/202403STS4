package com.sky.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.sky.dto.Dept;
import com.sky.dto.Emp;





@Repository
public class EmpDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public List<Dept> allList(){
		List<Dept> list = new ArrayList<>();
		SqlRowSet rs = jdbcTemplate.queryForRowSet("select * from dept");
		while(rs.next()) {
			Dept dept = Dept.builder().deptno(rs.getInt("deptno"))
					.dname(rs.getString("dname"))
					.loc(rs.getString("loc")).build();
			list.add(dept);
		}
		return list;
	}
	
	public List<Emp> selectAll() {
		List<Emp> results = jdbcTemplate.query( 
				"select * from EMP", 
				(rs, rowNum)->{
					Emp emp = new Emp(
						rs.getInt("EMPNO"),
						rs.getString("ENAME"),
						rs.getString("JOB"),
						rs.getInt("MGR"),
						rs.getString("HIREDATE"),
						rs.getInt("SAL"),
						rs.getInt("COMM"),
						rs.getInt("DEPTNO"));
				return emp;
			});
		return results;
	}
	
	public List<Emp> selectByEmail(int deptno) {
	    List<Emp> results = jdbcTemplate.query(
	            "SELECT * FROM emp WHERE deptno = ?",
	            new Object[]{deptno},
	            (rs, rowNum) -> new Emp(
	                    rs.getInt("EMPNO"),
	                    rs.getString("ENAME"),
	                    rs.getString("JOB"),
	                    rs.getInt("MGR"),
	                    rs.getString("HIREDATE"),
	                    rs.getInt("SAL"),
	                    rs.getInt("COMM"),
	                    rs.getInt("DEPTNO")
	            )
	    );
	    return results;
	}
	
	public List<Emp> updateForm(Integer empno) {
	    String sql = "SELECT * FROM emp WHERE empno = ?";
	    List<Emp> results = jdbcTemplate.query(
	        sql,
	        new Object[]{empno},
	        (rs, rowNum) -> new Emp(
	            rs.getInt("EMPNO"),
	            rs.getString("ENAME"),
	            rs.getString("JOB"),
	            rs.getInt("MGR"),
	            rs.getString("HIREDATE"),
	            rs.getInt("SAL"),
	            rs.getInt("COMM"),
	            rs.getInt("DEPTNO")
	        )
	    );
	    return results;
	}



	
	
	
	public void update(Emp emp) {
		jdbcTemplate.update("update emp set ename=?,job=?,mgr=?,hiredate=?,sal=?,comm=? where empno=?",
				emp.getEname(),emp.getJob(),emp.getMgr(),emp.getHiredate(),emp.getSal(),emp.getComm(),emp.getEmpno());
	}


}
