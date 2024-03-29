package com.sky.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sky.dao.MemberDao;
import com.sky.dto.Member;
import com.sky.service.MemberCountService;

@Controller
public class MyController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberCountService memberCountService;
	
	@GetMapping("/")
	public String root(Model model) { //interface 선택해야함
		model.addAttribute("str",memberDao.count());
		model.addAttribute("list",memberCountService.selectAll());
		return "sample";
	}
	
	@PostMapping("/insert")
	public String insert(Member member) {
		memberCountService.insert(member);
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String update(Member member) {
		memberCountService.update(member);
		return "redirect:/";
	}
	@GetMapping("/updateForm")
	public String select(Model model,@RequestParam String email) {
		model.addAttribute("select", memberCountService.selectByEmail(email));	
		return "updateForm";
		
	}
	
	@GetMapping("/delete")
	public String delete(int id) {
		memberCountService.delete(id);
		return "redirect:/";
	}
	
	
}
