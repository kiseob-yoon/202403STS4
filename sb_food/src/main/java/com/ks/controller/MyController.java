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
import com.ks.dto.Store;
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
	    //String id = (String) session.getAttribute("id");
	    //String pw = (String) session.getAttribute("pw");
		return "login_main";
	}
	@PostMapping("/login")
	public String login(HttpSession session, Model model, String id, String pw, RedirectAttributes redirectAttributes) {
		
	    boolean isLoggedIn = loginService.LoginConfirm(id, pw);
	    
	    
	    if(isLoggedIn) {
	    	session.setAttribute("LoggedIn", true);
		    model.addAttribute("LoggedIn", isLoggedIn);
	    } else {
	        redirectAttributes.addFlashAttribute("error", "로그인 실패");
	        return "redirect:/login_main";
	    }
	    
        if ("admin".equals(id)) {
            session.setAttribute("adminIn",id);
        }
        model.addAttribute("adminData", session.getAttribute("adminIn"));
		model.addAttribute("login", loginService.selectForLogin(id, pw));		
	    session.setAttribute("id", loginService.selectById(id));
	    session.setAttribute("id2", id);
		model.addAttribute("storeAllList", storeService.selectStoreList());
		model.addAttribute("storePointer", storeService.selectStorePointer());
		
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
		return "redirect:/login_main";
	}
	@GetMapping("/member_update")
	public String member_update(Member member) {
		loginService.memberUpdate(member);
		return "redirect:/";
	}
	@GetMapping("/member_delete")
	public String member_delete(HttpSession session,int memberno) {
		session.invalidate();
		loginService.memberDelete(memberno);
		return "redirect:/";
	}
	
	@GetMapping("/member_recent")
	public String member_recent(HttpSession session,Model model) {
		Member member = (Member) session.getAttribute("id");
		String memberId = member.getId(); // 멤버 객체에서 memberId 추출
	    model.addAttribute("memberInfo", loginService.selectById(memberId));
		return "member_update";
	}
	
	
	
	@GetMapping("/storeForm")
	public String storeForm(HttpSession session,Model model) {
		Member member = (Member) session.getAttribute("id");
		String memberId = null;
		if (member != null) {
		    memberId = member.getId(); // 멤버 객체에서 memberId 추출
		}
		
	    model.addAttribute("memberId", loginService.selectById(memberId));
		return "storeForm";
	}
	@GetMapping("/store_submit")
	public String store_submit(Model model, Store store) {
		storeService.insertStore(store);
		return "redirect:/";
	}
	
	@GetMapping("/storeUpdateForm")
	public String storeUpdateForm(Model model, int id) {
		model.addAttribute("store",storeService.selectStoretById(id));
		return "storeUpdateForm";
	}
	@GetMapping("/store_update")
	public String storeUpdate(Model model, int id,@RequestParam(defaultValue = "1", name = "page") int pageNo,HttpSession session,Store store) {		
		storeService.updateStore(store);
		return "redirect:/menupan?id"+ '=' + id;
	}
	@GetMapping("/store_delete")
	public String storeDelete(int id) {
		storeService.deleteStore(id);
		return "redirect:/";
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
		model.addAttribute("storePointer", storeService.selectStorePointer());
		
		model.addAttribute("adminData", session.getAttribute("adminIn"));
		return "root";
	}
	
	@GetMapping("selectAll")
	public String selectAll(Model model) {
		model.addAttribute("storeAllList", storeService.selectStoreList());
		model.addAttribute("storePointer", storeService.selectStorePointer());
		return "selectAll";
	}
	@GetMapping("selectRank")
	public String selectRank(Model model) {
		model.addAttribute("storeRank", storeService.selectRank());
		return "selectRank";
	}
	@GetMapping("selectStore")
	public String selectStore(HttpSession session,Model model,String storename) {
		model.addAttribute("selectStore", storeService.selectStore(storename));
		model.addAttribute("adminData", session.getAttribute("adminIn"));
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
		
		model.addAttribute("adminData", session.getAttribute("adminIn"));
	
		
	    boolean isLoggedIn = false;
	    session.getAttribute("LoggedIn");
	    if(isLoggedIn) {
		    model.addAttribute("LoggedIn", isLoggedIn);
	    }
	    
		Member member = (Member) session.getAttribute("id");
		String memberId = null;
		if (member != null) {
		    memberId = member.getName();
		    	model.addAttribute("commentModify", memberId);
		    
		}
	    	
		
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
