package com.kosta.inhair.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.inhair.domain.Designer;
import com.kosta.inhair.domain.HairShop;
import com.kosta.inhair.domain.Product;
import com.kosta.inhair.domain.Reserve;
import com.kosta.inhair.domain.User;
import com.kosta.inhair.service.DesignerService;
import com.kosta.inhair.service.HairShopService;
import com.kosta.inhair.service.ProductService;
import com.kosta.inhair.service.ReserveService;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private HairShopService hairshopService;
	@Autowired
	private ProductService productService;
	@Autowired
	private DesignerService designerService;
	
	// 고객 예약 등록 화면 표시
	@RequestMapping("/reserve/userCreateView")
	public ModelAndView userReserveCreateView(HttpSession session, HttpServletRequest req) {
		User user = (User)session.getAttribute("loginedUser");
		Calendar cal = Calendar.getInstance();
	      int[] days = new int[7];
	      for(int i=0;i<7;i++) {
	         int day = cal.get(cal.DATE) + i;
	         days[i] = day;
	      }
	      
	    req.setAttribute("days", days);
		session.setAttribute("loginedUser", user);
		
		ModelAndView modelAndView = new ModelAndView("reserve/reserve");
		return modelAndView;
	}

	// 고객 예약 등록
	@RequestMapping("/reserve/userCreate")
	public ModelAndView userReserveCreate(Reserve reserve, HttpSession session) {
		String day = reserve.getDays();
		Calendar cal = Calendar.getInstance();
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int days = Integer.parseInt(day);
		
		reserve.setDays(year+"."+month+"."+days);
		reserveService.createReserve(reserve);
		// User MyPage로 이동.
		
		ModelAndView modelAndView = new ModelAndView("redirect:/user/updateView");
		// 예약완료시 예약현황 클릭
		int resultReserve = 0;
		resultReserve = 1;
		session.setAttribute("resultReserve", resultReserve);
		return modelAndView;
	}
	
	// 미용실 정보 검색(구)
	@RequestMapping(value="/reserve/hairshopSearchByGu", method=RequestMethod.POST)
	@ResponseBody
	public Object hairshopSearchByGu(@RequestParam Map<String,Object> map) {
	     
	    String gu = (String) map.get("gu"); //검색코드
	     
	    //실제로 해당 부분은 서비스에서 처리 해야 하지만 그냥 Controller에서 처리
	    //검색코드를 조건으로 값을 가져 와야 하는데 설명을 위해 임의적으로 값을 셋팅
	 
	    List<HairShop> list = hairshopService.hairshopSearchByAddress(gu);
	     
	    Map<String, Object> retVal = new HashMap<String, Object>();
	     
	    retVal.put("shopList", list); //bookList란 키로 bookList의 값을 넣어줍니다. (웹에서 bookList키로 추출
	    retVal.put("code", "OK");
	    
	    return retVal;
	     
	}
	// 상품 정보 검색(샵코드)
	@RequestMapping(value="/reserve/productSearchByShopCode", method=RequestMethod.POST)
	@ResponseBody
	public Object productSearchByShopCode(@RequestParam Map<String,Object> map) {
	     
	    String code = (String) map.get("code"); //검색코드
	     
	    //실제로 해당 부분은 서비스에서 처리 해야 하지만 그냥 Controller에서 처리
	    //검색코드를 조건으로 값을 가져 와야 하는데 설명을 위해 임의적으로 값을 셋팅
	 
	    List<Product> list = productService.productAllSearch(code);
	     
	    Map<String, Object> retVal = new HashMap<String, Object>();
	    retVal.put("styleList", list); //bookList란 키로 bookList의 값을 넣어줍니다. (웹에서 bookList키로 추출
	    retVal.put("code", "OK");
	    
	    return retVal;
	     
	}

	// 디자이너 일정 검색
	@RequestMapping(value="/reserve/designerSearchBySchedule", method=RequestMethod.POST)
	@ResponseBody
	public Object designerSearchBySchedule(@RequestParam Map<String,Object> map) {
	     
	    String code = (String) map.get("code"); //검색코드
	    String days = (String) map.get("days"); //날짜
	    String time = (String) map.get("leadtime");
	    System.out.println("========================================================");
	    System.out.println(code);
	    System.out.println(days);
	    System.out.println(time);
	    
	    int leadtime = Integer.parseInt(time);
	   
	    HairShop hairShop = hairshopService.hairshopSearch(code);
	    int open = hairShop.getOpen();
	    int close = hairShop.getClose();
	    
	    List<Designer> designerList = designerService.designerListByHairshop(code);
	    List<Designer> resultDesignerList = designerService.openCloseDesignerSchedule(open, close, designerList);
	    
	    List<Designer> list = new ArrayList<Designer>();
	    for(Designer designer : resultDesignerList) {
	    	Designer de = designer;
	    	designer = designerService.reserveDesignerSchedule(code, de.getName(), days, leadtime, de);
	    	list.add(designer);
	    }
	    Map<String, Object> retVal = new HashMap<String, Object>();
	    retVal.put("designerList", list);
	    retVal.put("code", "OK");
	    
	    return retVal;
	     
	}
	
	// 예약 취소
	@RequestMapping("/reserve/delete")
	public ModelAndView reserveDelete(int reserve_id) {
		reserveService.deleteReserve(reserve_id);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}
	
	// 예약 완료(마일리지 적립 시술금액의 5%)
	@RequestMapping("/reserve/fulfill")
	public ModelAndView fulfillReserve(String userId, String productName) {
		reserveService.fulfillReserve(userId, productName);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}

	// 예약 불이행(마일리지 차감?)
	@RequestMapping("/reserve/unfulfilled")
	public ModelAndView unfulfilledReserve(String userId, String productName) {
		reserveService.unfulfilledReserve(userId, productName);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}
	

	// 관리자 예약 등록
	@RequestMapping("/reserve/adminCreate")
	public ModelAndView adminReserveCreate(Reserve reserve) {
		String day = reserve.getDays();
		Calendar cal = Calendar.getInstance();
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int days = Integer.parseInt(day);
		
		reserve.setDays(year+"."+month+"."+days);
		reserveService.adminCreateReserve(reserve);
		// User MyPage로 이동.
		
		ModelAndView modelAndView = new ModelAndView("redirect:/reserve/list");
		// 예약완료시 예약현황 클릭
		return modelAndView;
	}

	// 헤어샵 별 전체 예약 리스트
	@RequestMapping("/reserve/list")
	public ModelAndView reserveList(HttpSession session) {
		HairShop admin = (HairShop)session.getAttribute("loginedUser");
		String code = admin.getCode();
		Calendar cal = Calendar.getInstance();
		String days = String.valueOf(cal.get(cal.DATE));
		List<Product> pList = productService.productAllSearch(code);
		
		HairShop hairShop = hairshopService.hairshopSearch(code);
	    int open = hairShop.getOpen();
	    int close = hairShop.getClose();
	    
	    List<Designer> designerList = designerService.designerListByHairshop(code);
	    List<Designer> resultDesignerList = designerService.openCloseDesignerSchedule(open, close, designerList);
	    
	    List<Designer> dList = new ArrayList<Designer>();
	    for(Designer designer : resultDesignerList) {
	    	Designer de = designer;
	    	designer = designerService.reserveDesignerSchedule(code, de.getName(), days, 1, de);
	    	dList.add(designer);
	    }
		
		ModelAndView modelAndView = new ModelAndView("reserve/reserveCheck_h");
		modelAndView.addObject("productList", pList);
		modelAndView.addObject("designerList", dList);
		modelAndView.addObject("shop", admin);
		return modelAndView;
	}
	
//
//	// 개인 예약 현황
//	public ModelAndView reserveListByUser(String user_id) {
//		return null;
//	}
	// 디자이너별 예약 리스트
	@RequestMapping("/reserve/designerList")
	public ModelAndView reserveListByDesigner(HttpSession session) {
		Designer loginedUser = (Designer)session.getAttribute("loginedUser");
		List<Reserve> list = reserveService.reserveListByDesigner(loginedUser.getShopCode(), loginedUser.getName());
		
		String code = loginedUser.getShopCode();
		Calendar cal = Calendar.getInstance();
		String days = String.valueOf(cal.get(cal.DATE));

		HairShop hairShop = hairshopService.hairshopSearch(code);
	    int open = hairShop.getOpen();
	    int close = hairShop.getClose();
	    
	    List<Designer> designerList = designerService.designerListByHairshop(code);
	    List<Designer> resultDesignerList = designerService.openCloseDesignerSchedule(open, close, designerList);
	    
	    List<Designer> dList = new ArrayList<Designer>();
	    for(Designer designer : resultDesignerList) {
	    	Designer de = designer;
	    	designer = designerService.reserveDesignerSchedule(code, de.getName(), days, 1, de);
	    	dList.add(designer);
	    }
		
		ModelAndView modelAndView = new ModelAndView("reserve/reserveCheck_d");
		modelAndView.addObject("designerList", dList);
		modelAndView.addObject("reserveDesignerList", list);
		return modelAndView;
	}

}
