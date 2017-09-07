package com.kosta.inhair.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.kosta.inhair.dao.PortfolioDAO;
import com.kosta.inhair.dao.SqlSessionFactoryProvider;
import com.kosta.inhair.domain.Portfolio;

@Repository
public class PortfolioDAOLogic implements PortfolioDAO {

	private SqlSessionFactory factory;

	public PortfolioDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int portfolioCreate(Portfolio portfolio) {

		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.insert("portfolioCreate", portfolio);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}

		return result;
	}

	@Override
	public int portfolioUpdate(Portfolio portfolio) {

		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.update("portfolioUpdate", portfolio);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}

		return result;
	}

	@Override
	public int portfolioDelete(int portfolio_id) {

		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.delete("portfolioDelete", portfolio_id);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}

		return result;
	}

	@Override
	public Portfolio portfolioSearch(int portfolio_id) {

		SqlSession session = factory.openSession();
		try {
			return session.selectOne("portfolioSearch", portfolio_id);
		} finally {
			session.close();
		}

	}

	@Override
	public List<Portfolio> portfolioList(String shopCode) {

		SqlSession session = factory.openSession();
		List<Portfolio> list = null;
		try {
			list= session.selectList("portfolioList", shopCode);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Portfolio> portfolioListByDesigner(String designer_id) {
		SqlSession session = factory.openSession();
		List<Portfolio> list = null;
		try {
			list= session.selectList("portfolioListByDesigner", designer_id);
		} finally {
			session.close();
		}
		return list;
	}


}
