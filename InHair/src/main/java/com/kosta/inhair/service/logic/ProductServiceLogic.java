package com.kosta.inhair.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.ProductDAO;
import com.kosta.inhair.domain.Product;
import com.kosta.inhair.service.ProductService;

@Service
public class ProductServiceLogic implements ProductService {

	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int productCreate(Product product) {
		return productDAO.productCreate(product);
	}

	@Override
	public int productUpdate(Product product) {
		return productDAO.productUpdate(product);
	}

	@Override
	public int productDelete(int product_id) {
		return productDAO.productDelete(product_id);
	}

	@Override
	public Product productSearch(int product_id) {
		return productDAO.productSearch(product_id);
	}

	@Override
	public List<Product> productAllSearch(String shopCode) {
		return productDAO.productAllSearch(shopCode);
	}

	@Override
	public Product productSearchByName(String productName) {
		return productDAO.productSearchByName(productName);
	}

}
