package com.sky.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sky.dao.EmpDao;
import com.sky.dto.Dept;
import com.sky.dto.Emp;
import com.sky.dto.State;


@Controller
public class MyController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private EmpDao empDao;
	
	@Autowired
	State state;
	
	
	@GetMapping("/")
	public String root(Model model) {
		model.addAttribute("list2",empDao.selectAll());
		model.addAttribute("list", empDao.allList());
		
		return "root";
	}
	
	@GetMapping("/selectEmp")
	public String select(Model model , int deptno) {		
		model.addAttribute("list2",empDao.selectByEmail(deptno));
		state.setDeptno(deptno);
		model.addAttribute("list", empDao.allList());
		return "root";
	}
	
	@GetMapping("/updateForm")
	public String updateForm(Model model, Integer empno) {
		model.addAttribute("list", empDao.allList());
		model.addAttribute("select_emp", state.getEmpno());		
		model.addAttribute("updateForm",empDao.updateForm(empno));
		return "updateForm";
	}
	
	
	
}
