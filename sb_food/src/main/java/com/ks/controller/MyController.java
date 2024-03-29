package com.ks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ks.dto.Food;
import com.ks.dto.Store;
import com.ks.repository.FoodMapper;
import com.ks.service.MenuService;
import com.ks.service.StoreService;

@Controller
public class MyController {
	
	@Autowired
	private FoodMapper foodMapper; 
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/")
	public String root(Model model) {
		return "root";
	}
	
	@GetMapping("menupan")
	public String menupan(Model model, int id) {
		model.addAttribute("store",storeService.selectStoretById(id));
		model.addAttribute("menu", menuService.getAllMenus(id));
		model.addAttribute("menupan",foodMapper.selectFoodList(id));
		return "menupan";
	}
	
	@GetMapping("insertForm")
	public String insertForm(Model model, int id) {
		model.addAttribute("store",storeService.selectStoretById(id));
		return "insertForm";
	}
	@GetMapping("/updateForm")
	public String updateForm(Model model,@RequestParam int num) {
		model.addAttribute("update", menuService.selectMenutById(num));
		return "updateForm";
	}

	@GetMapping("/insert")
	public String insert(Model model,Food food, @RequestParam(value = "id") Integer id) {
		model.addAttribute("store",storeService.selectStoretById(id));
		menuService.addMenu(food);
		return "redirect:/menupan?id"+ '=' + id;
	}
	@GetMapping("/update")
	public String update(Food food) {
		menuService.updateMenu(food);
		return "redirect:/";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int num) {
		menuService.deleteMenu(num);
		return "redirect:/";
	}
	@GetMapping("/select")
	public String select(Model model,@RequestParam int num) {
		model.addAttribute("select", menuService.selectMenutById(num));
		return "redirect:/";
	}
	
	@GetMapping("/ajax1")
	public String ajax() {
		return "ajax1";
	}
	
	
}
