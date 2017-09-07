package com.kosta.inhair.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.inhair.domain.Designer;
import com.kosta.inhair.domain.HairShop;
import com.kosta.inhair.domain.Reserve;
import com.kosta.inhair.domain.User;
import com.kosta.inhair.service.DesignerService;
import com.kosta.inhair.service.HairShopService;
import com.kosta.inhair.service.ProductService;
import com.kosta.inhair.service.ReserveService;
import com.kosta.inhair.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DesignerService designerService;
	
	@Autowired
	private HairShopService hairShopService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private ProductService productService;
	
	int check = 0;
	int option = 0;

	@RequestMapping("/")
	public ModelAndView main(HttpServletRequest req) {
		option = 0;
		req.setAttribute("option", option);
		
		List<HairShop> list = hairShopService.hairShopList();
		int index =0;
		for(int i=0;i<list.size();i++){
			if("8282".equals(list.get(i).getCode())){
				index=i;
			}
		}
		
		list.remove(index);
		ModelAndView modelAndView = new ModelAndView("main");
		modelAndView.addObject("hairshopList", list);
		
		return modelAndView;
	}
	
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView modelAndView = new ModelAndView("join");
		return modelAndView;
	}
	
	@RequestMapping("/user/join")
	public ModelAndView userCreate(User user){
		user.setMileage(0);
		user.setRank("N");
		userService.userCreate(user);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}
	
	@RequestMapping("/user/joinView")
	public ModelAndView userCreateView(){
		ModelAndView modelAndView = new ModelAndView("user/join_n");
		return modelAndView;
	}
	
	@RequestMapping("/user/updateView")
	public ModelAndView userUpdateView(HttpSession session){
		User user = (User)session.getAttribute("loginedUser");
		session.setAttribute("loginedUser", user);
		List<Reserve> list = reserveService.reserveListByUser(user.getId());

		ModelAndView modelAndView = new ModelAndView("user/mypage_n");	
		modelAndView.addObject("reserveUserList", list);
		
		return modelAndView;
	}
	
	@RequestMapping("/user/update")
	public ModelAndView userUpdate(User user, HttpSession session) {
		User user2 = (User)session.getAttribute("loginedUser");
		String id = user2.getId();
		user.setId(id);
		userService.userUpdate(user);
		
		user = userService.userSearch(user.getId());
		user.setRank("N");
		option = 0;
		session.setAttribute("option", option);
		session.setAttribute("loginedUser", user);
		ModelAndView modelAndView = new ModelAndView("redirect:/");	
		return modelAndView;
	}
	
	@RequestMapping("/user/idCheck")
	public @ResponseBody String idCheck(String loginId) {
		boolean result = userService.idCheck(loginId);

		if (result) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping("/user/loginCheck")
	public @ResponseBody String loginCheck(String id, String password) {
		boolean result = userService.login(id, password);
		if (result) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping("/user/login")
	public ModelAndView login(String id, String password, HttpSession session, HttpServletRequest request) {
		ModelAndView modelAndViews = null;

		String memberCheck = request.getParameter("options");
		if (memberCheck.equals("N")) {
			boolean result = userService.login(id, password);
			if (result == false) {
				modelAndViews = new ModelAndView("redirect:/");
				check = 1;
				session.setAttribute("check", check);
			} else {
				modelAndViews = new ModelAndView("redirect:/");
				User user = userService.userSearch(id);
				user.setRank("N");
				session.setAttribute("loginedUser", user);				
			}
		} else if (memberCheck.equals("D")) {
			boolean result = designerService.login(id, password);
			if(result == false) {
				modelAndViews = new ModelAndView("redirect:/");
				check = 1;
				session.setAttribute("check", check);
			} else {
				modelAndViews = new ModelAndView("redirect:/");
				Designer designer = designerService.designerSearch(id);
				designer.setRank("D");
				session.setAttribute("loginedUser", designer);
			}
		} else if (memberCheck.equals("H")) {
			boolean result = hairShopService.login(id, password);
			if(result == false) {
				modelAndViews = new ModelAndView("redirect:/");
				check = 1;
				session.setAttribute("check", check);
			} else {
				modelAndViews = new ModelAndView("redirect:/");
				HairShop hairShop = hairShopService.hairshopSearch(id);
				hairShop.setRank("H");
				session.setAttribute("loginedUser", hairShop);
			}
		}
		return modelAndViews;
	}
	
	@RequestMapping("/user/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}
	
	@RequestMapping("/user/secession")
	public ModelAndView userDelete(String password, HttpSession session) {
		User user = (User)session.getAttribute("loginedUser");
		String id = user.getId();
		ModelAndView modelAndView = null;
		if(password.equals(user.getPassword())) {
			userService.userDelete(id, password);
			session.invalidate();
			modelAndView = new ModelAndView("redirect:/");
		} else {
			option = 1;
			session.setAttribute("option", option);
			modelAndView = new ModelAndView("redirect:/user/updateView");
		}

		return modelAndView;
	}
	
}
