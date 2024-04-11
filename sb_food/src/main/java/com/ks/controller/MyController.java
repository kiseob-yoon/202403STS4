package com.ks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ks.dto.Comments;
import com.ks.dto.Food;
import com.ks.dto.Member;
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
	    session.setAttribute("id2", id);
		model.addAttribute("storeAllList", storeService.selectStoreList());
//	    session.setAttribute("pw", pw);
	    return "root";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/member_join")
	public String member_join() {
		return "member_join";
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		loginService.memberJoin(member);
		return "redirect:/";
	}
	@GetMapping("/member_update")
	public String member_update(Member member) {
		loginService.memberUpdate(member);
		return "redirect:/";
	}
	
	@GetMapping("/member_recent")
	public String member_recent(HttpSession session,Model model) {
		Member member = (Member) session.getAttribute("id");
		String memberId = null;
		if (member != null) {
		    memberId = member.getId(); // 멤버 객체에서 memberId 추출
		}
		
	    model.addAttribute("memberInfo", loginService.selectById(memberId));
		return "member_update";
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
	@GetMapping("/redirect")
	public String redirectToMenupan(@RequestParam(name = "page") int pageNo, 
	                                 @RequestParam(name = "id") String id, 
	                                 RedirectAttributes redirectAttributes) {

	    redirectAttributes.addAttribute("id", id);
	    redirectAttributes.addAttribute("page", pageNo);

	    return "redirect:/menupan";
	}

	
	
//	*메인*
	
	//@GetMapping("/")
	public String main(Model model,HttpSession session,String id) {
	    return "root"; // root 페이지로 리다이렉트합니다.
	}
	
	@GetMapping("/")
	public String root(Model model,HttpSession session,String id) {
		
		model.addAttribute("login", loginService.selectById(id));
		String info = (String) session.getAttribute("id2");
	
		model.addAttribute("storeAllList", storeService.selectStoreList());
		return "root";
	}
	
	@GetMapping("selectAll")
	public String selectAll(Model model) {
		model.addAttribute("storeAllList", storeService.selectStoreList());
		return "selectAll";
	}
	@GetMapping("selectRank")
	public String selectRank(Model model) {
		model.addAttribute("storeRank", storeService.selectRank());
		return "selectRank";
	}
	@GetMapping("selectStore")
	public String selectStore(Model model,String storename) {
		model.addAttribute("selectStore", storeService.selectStore(storename));
		return "selectStore";
	}
	
	
	
	@GetMapping("likePost")
	public String like(int storeId, HttpSession session) {
		Member member = (Member) session.getAttribute("id");
		if (member != null) {
		    int memberId = member.getMemberno(); // 멤버 객체에서 memberId 추출
		    storeService.likePost(memberId, storeId); // memberId를 파라미터로 사용하여 서비스 메서드 호출
		}
		return "redirect:/menupan?id"+ '=' + storeId;
	}
	
	@GetMapping("menupan")
	public String menupan(Model model, int id,@RequestParam(defaultValue = "1", name = "page") int pageNo,HttpSession session) {
		model.addAttribute("store",storeService.selectStoretById(id));
		model.addAttribute("menu", menuService.getAllMenus(id));
		model.addAttribute("menupan",foodMapper.selectFoodList(id));
		model.addAttribute("comments", commentsService.paging(id, pageNo, 5));
		//model.addAttribute("comments", commentsService.selectAll(id));
		model.addAttribute("pgnList", commentsService.getPagination(pageNo));
		model.addAttribute("msgList", commentsService.getMsgList(pageNo));
		String id2 = (String) session.getAttribute("id2");
		model.addAttribute("info", loginService.selectById(id2));
		model.addAttribute("grade", commentsService.average(id));
		model.addAttribute("grade2", commentsService.average(id));
		model.addAttribute("count", commentsService.commentCount(id));
		storeService.updateHits(id);
		
		String info = (String) session.getAttribute("id2");
		
		
		if(info == null) {
			info = "로그인";
		}
		else {
			info = "로그아웃";
		}
		model.addAttribute("status", info);
		
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
	@GetMapping("/commentsUpdateForm")
	public String commentsUpdateForm(Model model, HttpSession session,Integer num,int id) {
		model.addAttribute("selectCommentstById", commentsService.selectCommentstById(num,id));

		return "commentsUpdateForm";
	}
	@GetMapping("/commentsUpdate")
	public String commentsUpdateForm(HttpSession session,Comments comments,int id) {
		Member member = (Member) session.getAttribute("id");
		if (member != null) {
		    int memberId = member.getMemberno();
		    
		}
	    commentsService.updateComments(comments);
		return "redirect:/menupan?id"+ '=' + id;
	}
	@GetMapping("/commentsDelete")
	public String commentsDelete(Model model,int num,int id) {
		commentsService.deleteComments(num);
		return "redirect:/menupan?id"+ '=' + id;
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
