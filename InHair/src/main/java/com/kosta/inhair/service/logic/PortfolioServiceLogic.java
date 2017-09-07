package com.kosta.inhair.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.PortfolioDAO;
import com.kosta.inhair.domain.Portfolio;
import com.kosta.inhair.service.PortfolioService;


@Service
public class PortfolioServiceLogic implements PortfolioService{
	
	
	@Autowired
	private PortfolioDAO portfolioDAO;

	@Override
	public int portfolioCreate(Portfolio portfolio) {
		return portfolioDAO.portfolioCreate(portfolio);
	}

	@Override
	public int portfolioUpdate(Portfolio portfolio) {
		return portfolioDAO.portfolioUpdate(portfolio);
	}

	@Override
	public int portfolioDelete(int portfolio_id) {
		return portfolioDAO.portfolioDelete(portfolio_id);
	}

	@Override
	public Portfolio portfolioSearch(int portfolio_id) {
		return portfolioDAO.portfolioSearch(portfolio_id);
	}

	@Override
	public List<Portfolio> portfolioList(String shopCode) {
		return portfolioDAO.portfolioList(shopCode);
	}

	@Override
	public List<Portfolio> portfolioListByDesigner(String designer_id) {
		return portfolioDAO.portfolioListByDesigner(designer_id);
	}

}

