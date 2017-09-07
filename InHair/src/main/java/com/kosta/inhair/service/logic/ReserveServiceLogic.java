package com.kosta.inhair.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.ProductDAO;
import com.kosta.inhair.dao.ReserveDAO;
import com.kosta.inhair.dao.UserDAO;
import com.kosta.inhair.domain.Product;
import com.kosta.inhair.domain.Reserve;
import com.kosta.inhair.domain.User;
import com.kosta.inhair.service.ReserveService;

@Service
public class ReserveServiceLogic implements ReserveService{
	
	@Autowired
	ReserveDAO reserveDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	UserDAO userDAO;

	@Override
	public int createReserve(Reserve reserve) {
		return reserveDAO.createReserve(reserve);
	}

	@Override
	public int adminCreateReserve(Reserve reserve) {
		return reserveDAO.adminCreateReserve(reserve);
	}

	@Override
	public int deleteReserve(int reserve_id) {
		return reserveDAO.deleteReserve(reserve_id);
	}

	@Override
	public void fulfillReserve(String userId, String productName) {
		Product product = productDAO.productSearchByName(productName);
		int mileage = product.getPrice() * (5/100);
		User user = userDAO.userSearch(userId);
		int userMileage = user.getMileage() + mileage;
		user.setMileage(userMileage);
		userDAO.userUpdate(user);
	}

	@Override
	public void unfulfilledReserve(String userId, String productName) {
		int mileage = 20;
		User user = userDAO.userSearch(userId);
		int userMileage = user.getMileage() - mileage;
		user.setMileage(userMileage);
		userDAO.userUpdate(user);
	}

	@Override
	public List<Reserve> reserveList(String shopCode) {
		return reserveDAO.reserveList(shopCode);
	}

	@Override
	public List<Reserve> reserveListByDesigner(String shopCode, String designer_name) {
		return reserveDAO.reserveListByDesigner(shopCode, designer_name);
	}

	@Override
	public List<Reserve> reserveListByUser(String user_id) {
		return reserveDAO.reserveListByUser(user_id);
	}

	
}
