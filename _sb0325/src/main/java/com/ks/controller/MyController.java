package com.ks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ks.mapper.BoardMapper;

@Controller
public class MyController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@GetMapping("/")
	public String root(Model model) {
		model.addAttribute("count",boardMapper.selectCount());
		boardMapper.selectCount();
		return "root";
	}
}
