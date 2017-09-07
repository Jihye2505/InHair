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
import com.kosta.inhair.domain.Portfolio;
import com.kosta.inhair.domain.Post;
import com.kosta.inhair.service.DesignerService;
import com.kosta.inhair.service.HairShopService;
import com.kosta.inhair.service.PortfolioService;
import com.kosta.inhair.service.PostService;

@Controller
public class DesignerController {

	@Autowired
	private DesignerService designerService;
	@Autowired
	private PostService postService;
	@Autowired
	private PortfolioService portfolioService;
	@Autowired
	private HairShopService hairShopService;

	int check = 0;
	int option = 0;

	// 디자이너
	@RequestMapping("/designer/codeCheck")
	public @ResponseBody String codeCheck(String code) {
		boolean result = designerService.shopCodeCheck(code);

		if (result) {
			return "true";
		}
		return "false";
	}

	@RequestMapping(value = "/designer/join", method = RequestMethod.POST)
	public ModelAndView designerCreate(Designer designer, @RequestParam("file") MultipartFile file) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\designer" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + designer.getId() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		designer.setImg(mTime + designer.getId() + ".png");
		designer.setRank("D");
		designer.setStarpoint(0);
		designerService.designerCreate(designer);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}

	@RequestMapping("/designer/joinView")
	public ModelAndView designerCreateView() {
		ModelAndView modelAndView = new ModelAndView("designer/join_d");
		return modelAndView;
	}

	@RequestMapping("/designer/idCheck")
	public @ResponseBody String idCheck(String loginId) {
		boolean result = designerService.idDesignerCheck(loginId);

		if (result) {
			return "true";
		}
		return "false";
	}

	@RequestMapping("/designer/updateView")
	public ModelAndView designerUpdateView(HttpSession session) {
		Designer designer = (Designer) session.getAttribute("loginedUser");
		session.setAttribute("loginedUser", designer);
		ModelAndView modelAndView = new ModelAndView("designer/mypage_d");
		return modelAndView;
	}

	@RequestMapping(value = "/designer/update", method = RequestMethod.POST)
	public ModelAndView designerUpdate(Designer designer, HttpSession session,
			@RequestParam("file") MultipartFile file) {
		Designer designer2 = (Designer) session.getAttribute("loginedUser");
		String id = designer2.getId();

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\designer" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + designer.getId() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		designer.setImg(mTime + designer.getId() + ".png");

		designer.setId(id);
		designerService.designerUpdate(designer);

		designer = designerService.designerSearch(designer.getId());
		designer.setRank("D");
		option = 0;
		session.setAttribute("option", option);
		session.setAttribute("loginedUser", designer);
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}

	@RequestMapping("/designer/secession")
	public ModelAndView designerDelete(String password, HttpSession session) {
		Designer designer = (Designer) session.getAttribute("loginedUser");
		String id = designer.getId();
		ModelAndView modelAndView = null;
		if (password.equals(designer.getPassword())) {
			designerService.designerDelete(id, password);
			session.invalidate();
			modelAndView = new ModelAndView("redirect:/");
		} else {
			option = 1;
			session.setAttribute("option", option);
			modelAndView = new ModelAndView("redirect:/designer/updateView");
		}
		return modelAndView;
	}

	@RequestMapping("/designer/list")
	public ModelAndView designerList() {
		ModelAndView modelAndView = new ModelAndView("designer/designer_all");
		List<Designer> list = designerService.designerList();
		List<Designer> lists = new ArrayList<Designer>();

		for (Designer designer : list) {
			designer.setStarpoint(postService.avgStarpoint(designer.getId()));
			designer.setShopName(hairShopService.hairshopSearch(designer.getShopCode()).getShopName());
			designer.setAddress(hairShopService.hairshopSearch(designer.getShopCode()).getAddress());
			lists.add(designer);
		}
		modelAndView.addObject("list", lists);

		return modelAndView;
	}

	@RequestMapping("/designer/listByAddress")
	public ModelAndView designerListByAddress(String gu) {

		List<Designer> list = designerService.designerListByAddress(gu);
		List<Designer> lists = new ArrayList<Designer>();

		for (Designer designer : list) {
			designer.setStarpoint(postService.avgStarpoint(designer.getId()));
			designer.setShopName(hairShopService.hairshopSearch(designer.getShopCode()).getShopName());
			designer.setAddress(hairShopService.hairshopSearch(designer.getShopCode()).getAddress());
			lists.add(designer);
		}

		ModelAndView modelAndView = new ModelAndView("designer/designer_all");
		modelAndView.addObject("list", lists);
		modelAndView.addObject("gu", gu);
		modelAndView.addObject("si", "서울특별시");

		return modelAndView;

	}

	@RequestMapping("/designer/detail")
	public ModelAndView designerDetail(String designer_id) {

		Designer designer = designerService.designerSearch(designer_id);
		designer.setStarpoint(postService.avgStarpoint(designer_id));
		designer.setShopName(hairShopService.hairshopSearch(designer.getShopCode()).getShopName());
		designer.setAddress(hairShopService.hairshopSearch(designer.getShopCode()).getAddress());
		ModelAndView modelAndView = new ModelAndView("designer/designerDetail");
		modelAndView.addObject("designer", designer);

		List<Portfolio> pfList = portfolioService.portfolioListByDesigner(designer_id);
		List<Post> postList = postService.postList(designer_id);

		modelAndView.addObject("pfList", pfList);
		modelAndView.addObject("postList", postList);

		return modelAndView;
	}

	@RequestMapping("/designer/designerOut")
	public ModelAndView designerOut(String designer_id) {
		Designer designer = designerService.designerSearch(designer_id);
		designerService.designerOut(designer_id);
		ModelAndView modelAndView = new ModelAndView("redirect:/hairshop/detail?shopCode=" + designer.getShopCode());

		return modelAndView;

	}

	@RequestMapping("/designer/image")
	public void imgDesigner(String designer_id, HttpServletResponse resp) throws IOException {

		String image = designerService.designerSearch(designer_id).getImg();

		InputStream in = null;
		FileInputStream fis = null;
		OutputStream out = null;

		if (image != null) {

			String imgName = image;
			String imagePath = "c:/image/designer";

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

	// 포트폴리오
	@RequestMapping("/portfolio/create")
	public ModelAndView portfolioCreateView(HttpSession session) {

		Designer loginedDesigner = (Designer) session.getAttribute("loginedUser");
		ModelAndView modelAndView = new ModelAndView("portfolio/portfolio");
		modelAndView.addObject("designer_id", loginedDesigner.getId());
		return modelAndView;
	}

	@RequestMapping(value = "/portfolio/create", method = RequestMethod.POST)
	public ModelAndView portfolioCreate(Portfolio portfolio, @RequestParam("file") MultipartFile file,
			String designer_id) {

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\portfolio" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + designer_id + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		portfolio.setImg(mTime + designer_id + ".png");

		portfolioService.portfolioCreate(portfolio);

		ModelAndView modelAndView = new ModelAndView(
				"redirect:/designer/detail?designer_id=" + portfolio.getDesigner_id());

		return modelAndView;
	}

	@RequestMapping("/portfolio/image")
	public void imgPortfolio(int portfolio_id, HttpServletResponse resp) throws IOException {

		String image = portfolioService.portfolioSearch(portfolio_id).getImg();

		InputStream in = null;
		FileInputStream fis = null;
		OutputStream out = null;

		if (image != null) {

			String imgName = image;
			String imagePath = "c:/image/portfolio";

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

	@RequestMapping("/portfolio/update")
	public ModelAndView portfolioUpdateView(int portfolio_id) {

		ModelAndView modelAndView = new ModelAndView("portfolio/portfolioUpdate");
		modelAndView.addObject("portfolio", portfolioService.portfolioSearch(portfolio_id));

		return modelAndView;

	}

	@RequestMapping(value = "/portfolio/update", method = RequestMethod.POST)
	public ModelAndView portfolioUpdate(Portfolio portfolio, @RequestParam("file") MultipartFile file) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\portfolio" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(
						dir.getAbsolutePath() + File.separator + mTime + portfolio.getDesigner_id() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		portfolio.setImg(mTime + portfolio.getDesigner_id() + ".png");
		portfolioService.portfolioUpdate(portfolio);

		ModelAndView modelAndView = new ModelAndView(
				"redirect:/designer/detail?designer_id=" + portfolio.getDesigner_id());
		return modelAndView;
	}

	@RequestMapping("/portfolio/delete")
	public ModelAndView portfolioDelete(int portfolio_id) {

		Portfolio portfolio = portfolioService.portfolioSearch(portfolio_id);
		portfolioService.portfolioDelete(portfolio_id);

		ModelAndView modelAndView = new ModelAndView(
				"redirect:/designer/detail?designer_id=" + portfolio.getDesigner_id());
		return modelAndView;

	}
	
}
