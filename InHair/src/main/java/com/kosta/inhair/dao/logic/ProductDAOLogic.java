package com.kosta.inhair.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.kosta.inhair.dao.ProductDAO;
import com.kosta.inhair.dao.SqlSessionFactoryProvider;
import com.kosta.inhair.domain.Product;

@Repository
public class ProductDAOLogic implements ProductDAO{

	private SqlSessionFactory factory;
	
	public ProductDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();

	}

	@Override
	public int productCreate(Product product) {

		SqlSession session = factory.openSession();
		int result = 0;
		try {
			result = session.insert("productCreate", product);
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
	public int productUpdate(Product product) {
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.update("productUpdate", product);
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
	public int productDelete(int product_id) {
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.delete("productDelete", product_id);
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
	public Product productSearch(int product_id) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("productSearch", product_id);
		} finally {
			session.close();
		}

	}

	@Override
	public List<Product> productAllSearch(String shopCode) {
		SqlSession session = factory.openSession();
		List<Product> list = null;
		try {
			list= session.selectList("productAllSearch", shopCode);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Product productSearchByName(String productName) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("productSearchByName", productName);
		} finally {
			session.close();
		}
	}

}
