package com.kosta.inhair.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.inhair.domain.HairShop;
import com.kosta.inhair.domain.Product;
import com.kosta.inhair.service.ProductService;


@Controller
public class ProductController {
	//test
	@Autowired
	private ProductService productService;


	//상품관리
	@RequestMapping("/product/detail")
	public ModelAndView productAllSearch(String shopCode) {
		ModelAndView modelAndView = new ModelAndView("product/productManaging");
		List<Product> list = productService.productAllSearch(shopCode);
		modelAndView.addObject("list", list);
		modelAndView.addObject("shopCode", shopCode);
	
		return modelAndView;
	}
	
	@RequestMapping("/product/create")
	public ModelAndView productCreateView(HttpSession session) {
		
		HairShop loginedHairShop = (HairShop) session.getAttribute("loginedUser");
		ModelAndView modelAndView = new ModelAndView("product/productRegister");
		modelAndView.addObject("shopCode", loginedHairShop.getCode());
		return modelAndView;
	}
	@RequestMapping(value = "/product/create", method = RequestMethod.POST)
	public ModelAndView productCreate(Product product) {
		
		productService.productCreate(product);
		ModelAndView modelAndView = new ModelAndView("redirect:detail?shopCode="+product.getShopCode());
		
		return modelAndView;
	}
	
	@RequestMapping("/product/update")
	public ModelAndView productUpdateView(int product_id) {
		
		ModelAndView modelAndView = new ModelAndView("product/productUpdate");
		modelAndView.addObject("product", productService.productSearch(product_id));
		return modelAndView;
		
	}

	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public ModelAndView productUpdate(Product product) {
		
		productService.productUpdate(product);
		ModelAndView modelAndView = new ModelAndView("redirect:detail?shopCode="+product.getShopCode());
		
		return modelAndView;
	}
	
	@RequestMapping("/product/delete")
	public ModelAndView productDelete(int product_id) {
		Product product = productService.productSearch(product_id);
		productService.productDelete(product_id);
		
		ModelAndView modelAndView = new ModelAndView("redirect:detail?shopCode="+product.getShopCode());
		return modelAndView;
	}
	
}
