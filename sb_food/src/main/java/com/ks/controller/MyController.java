package com.ks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ks.dto.Comments;
import com.ks.dto.Food;
import com.ks.repository.FoodMapper;
import com.ks.service.CommentsService;
import com.ks.service.LoginService;
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
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private CommentsService commentsService;
	
//	*로그인*
	@GetMapping("/login_main")
	public String loginForm(HttpSession session) {
	    String id = (String) session.getAttribute("id");
	    //String pw = (String) session.getAttribute("pw");
		return "login_main";
	}
	@PostMapping("/login")
	public String login(HttpSession session, Model model, String id, String pw) {
		model.addAttribute("login", loginService.selectForLogin(id, pw));		
	    session.setAttribute("id", loginService.selectById(id));
//	    session.setAttribute("pw", pw);
	    return "root";
	}
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login_main";
	}
	
//	*댓글*
	@GetMapping("/commentAdd")
	public String commentAdd(Comments comments, Model model, int id) {
		model.addAttribute("store",storeService.selectStoretById(id));
		model.addAttribute("menu", menuService.getAllMenus(id));
		model.addAttribute("menupan",foodMapper.selectFoodList(id));
		commentsService.insertComments(comments);
		return "redirect:/menupan?id"+ '=' + id;
	}
	
	
//	*메인*
	
	@GetMapping("/")
	public String root() {
		return "root";
	}
	
	@GetMapping("root")
	public String root(Model model,HttpSession session) {
		return "root";
	}
	
	@GetMapping("menupan")
	public String menupan(Model model, int id) {
		model.addAttribute("store",storeService.selectStoretById(id));
		model.addAttribute("menu", menuService.getAllMenus(id));
		model.addAttribute("menupan",foodMapper.selectFoodList(id));
		model.addAttribute("comments", commentsService.selectAll(id));
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
	public String update(Model model,Food food,@RequestParam(value = "id") Integer id) {
		menuService.updateMenu(food);
		model.addAttribute("store",storeService.selectStoretById(id));
		return "redirect:/menupan?id"+ '=' + id;
	}
	
	@GetMapping("/delete")
	public String delete(Model model,@RequestParam int num,@RequestParam(value = "id") Integer id) {
		menuService.deleteMenu(num);
		model.addAttribute("store",storeService.selectStoretById(id));
		return "redirect:/menupan?id=" + id;
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
