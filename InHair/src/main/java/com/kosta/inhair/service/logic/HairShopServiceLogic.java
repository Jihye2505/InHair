package com.kosta.inhair.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.HairShopDAO;
import com.kosta.inhair.dao.UserDAO;
import com.kosta.inhair.domain.HairShop;
import com.kosta.inhair.service.HairShopService;

@Service
public class HairShopServiceLogic implements HairShopService {
	
	@Autowired
	HairShopDAO hairshopDAO;

	@Override
	public boolean codeCheck(String shopCode) {
		return hairshopDAO.codeCheck(shopCode);
	}

	@Override
	public boolean login(String shopCode, String password) {
		HairShop hairShop = hairshopDAO.hairshopSearch(shopCode);
		
		if (hairShop != null && hairShop.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	@Override
	public int hairshopCreate(HairShop hairshop) {
		return hairshopDAO.hairshopCreate(hairshop);
	}

	@Override
	public int hairshopUpdate(HairShop hairshop) {
		return hairshopDAO.hairshopUpdate(hairshop);
	}

	@Override
	public HairShop hairshopSearch(String shopCode) {
		return hairshopDAO.hairshopSearch(shopCode);
	}

	@Override
	public List<HairShop> hairShopList() {
		return hairshopDAO.hairshopList();
	}

	@Override
	public List<HairShop> hairshopSearchByName(String name) {
		return hairshopDAO.hairshopSearchByName(name);
	}

	@Override
	public List<HairShop> hairshopSearchByAddress(String gu) {
		return hairshopDAO.hairshopSearchByAddress(gu);
	}

}
