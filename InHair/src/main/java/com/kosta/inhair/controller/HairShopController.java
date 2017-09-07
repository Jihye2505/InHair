package com.kosta.inhair.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.inhair.domain.Designer;
import com.kosta.inhair.domain.HairShop;
import com.kosta.inhair.domain.Portfolio;
import com.kosta.inhair.service.DesignerService;
import com.kosta.inhair.service.HairShopService;
import com.kosta.inhair.service.PortfolioService;
import com.kosta.inhair.service.PostService;

@Controller
public class HairShopController {
	
	@Autowired
	private HairShopService hairshopService;

	@Autowired
	private DesignerService designerService;
	
	@Autowired
	private PortfolioService portfolioService;
	
	@Autowired
	private PostService postService;
	
	int check = 0;
	int option = 0;
	
	@RequestMapping(value="/hairshop/join", method = RequestMethod.POST)
	public ModelAndView hairshopCreate(HairShop hairshop, HttpServletRequest request, @RequestParam("file") MultipartFile file){
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\hairshop" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + hairshop.getCode()	 + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		hairshop.setImg(mTime + hairshop.getCode() + ".png");
		
		
		String si = request.getParameter("si");
		String gu = request.getParameter("gu");
		String address = request.getParameter("address");
		hairshop.setRank("H");
		hairshop.setAddress(si+" "+gu+" "+address);
		hairshopService.hairshopCreate(hairshop);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}
	
	@RequestMapping("/hairshop/joinView")
	public ModelAndView hairshopCreateView(){
		ModelAndView modelAndView = new ModelAndView("hairshop/join_h");
		return modelAndView;
	}
	
	@RequestMapping("/hairshop/codeCheck")
	public @ResponseBody String codeCheck(String code) {
		boolean result = hairshopService.codeCheck(code);

		if (result) {
			return "true";
		}
		return "false";
	}
	@RequestMapping("/hairshop/updateView")
	public ModelAndView hairshopUpdateView(HttpSession session){
		HairShop hairShop = (HairShop)session.getAttribute("loginedUser");
	
		session.setAttribute("loginedUser", hairShop);
		ModelAndView modelAndView = new ModelAndView("hairshop/mypage_h");	
		return modelAndView;
	}
	
	@RequestMapping(value="/hairshop/update" , method = RequestMethod.POST)
	public ModelAndView hairshopUpdate(HairShop hairShop, HttpSession session, HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		HairShop hairShop2 = (HairShop)session.getAttribute("loginedUser");
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\hairshop" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + hairShop.getCode() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		hairShop.setImg(mTime + hairShop.getCode() + ".png");
		
		String si = request.getParameter("si");
		String gu = request.getParameter("gu");
		String address = request.getParameter("address");
		String code = hairShop2.getCode();
		hairShop.setCode(code);
		hairShop.setAddress(si+" "+gu+" "+address);
		hairshopService.hairshopUpdate(hairShop);
		
		hairShop = hairshopService.hairshopSearch(hairShop.getCode());
		hairShop.setRank("H");
		session.setAttribute("loginedUser", hairShop);
		ModelAndView modelAndView = new ModelAndView("redirect:/");	
		return modelAndView;
	}
	
	
	
	@RequestMapping("/hairshop/image")
	public void imgHairShop(String shopCode, HttpServletResponse resp) throws IOException {

		String image = hairshopService.hairshopSearch(shopCode).getImg();
		
		InputStream in = null;
		FileInputStream fis = null;
		OutputStream out = null;

		if (image != null) {

			String imgName = image;
			String imagePath = "c:/image/hairshop";

			fis = new FileInputStream(imagePath + "/" + imgName);
			in = new BufferedInputStream(fis);
		} else {
			resp.setContentType("image/png");
		}

		out = resp.getOutputStream();

		int readcnt = 0;
		byte[] buf = new byte[1024];

		while ((readcnt = in.read(buf)) != -1) {
			out.write(buf, 0, readcnt);

		}
		out.flush();

		if (in != null)
			in.close();
		if (out != null)
			out.close();
	}

	@RequestMapping("/hairshop/detail")
	public ModelAndView hairshopDetail(String shopCode){
		HairShop hairshop = hairshopService.hairshopSearch(shopCode);
		List<Designer> designerList = designerService.designerListByHairshop(shopCode);
		List<Portfolio> portfolioList = portfolioService.portfolioList(shopCode);
		List<Portfolio> lists = new ArrayList<Portfolio>();
		List<Designer> designerLists = new ArrayList<Designer>();
		for(Portfolio pf:portfolioList){
			Designer designer = designerService.designerSearch(pf.getDesigner_id());
			pf.setDesigner_name(designer.getName());
			lists.add(pf);
		}
		for(Designer designer : designerList) {
			designer.setStarpoint(postService.avgStarpoint(designer.getId()));
			designerLists.add(designer);
		}
		
		ModelAndView modelAndView = new ModelAndView("hairshop/shopDetail");
		modelAndView.addObject("hairshop", hairshop);
		modelAndView.addObject("designerList", designerLists);
		modelAndView.addObject("portfolioList", lists);
		
		return modelAndView;
		
	}
	
	@RequestMapping("/hairshop/hairshopSearchByName")
	public ModelAndView hairshopSearchByName(String name){
		
		List<HairShop> list = hairshopService.hairshopSearchByName(name);
		ModelAndView modelAndView = new ModelAndView("main");
		modelAndView.addObject("hairshopList", list);
		
		return modelAndView;
	}
	@RequestMapping("/hairshop/hairshopSearchByAddress")
	public ModelAndView hairshopSearchByAddress(String gu){
		
		List<HairShop> list = hairshopService.hairshopSearchByAddress(gu);
		ModelAndView modelAndView = new ModelAndView("main");
			modelAndView.addObject("hairshopList", list);
			modelAndView.addObject("gu", gu);
			modelAndView.addObject("si","서울특별시");

		return modelAndView;
	}
}
