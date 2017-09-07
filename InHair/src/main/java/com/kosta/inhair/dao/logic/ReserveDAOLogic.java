package com.kosta.inhair.dao.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.kosta.inhair.dao.ReserveDAO;
import com.kosta.inhair.dao.SqlSessionFactoryProvider;
import com.kosta.inhair.domain.Reserve;

@Repository
public class ReserveDAOLogic implements ReserveDAO{
	
	private SqlSessionFactory factory;

	public ReserveDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}


	@Override
	public int createReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int result = 0;
		
		try{
			result = session.insert("createReserve", reserve);
			if(result > 0) {
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
	public int adminCreateReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int result = 0;
		
		try{
			result = session.insert("adminCreateReserve", reserve);
			if(result > 0) { 
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
	public int deleteReserve(int reserve_id) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			result = session.delete("deleteReserve", reserve_id);
			if(result > 0 ) {
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
	public List<Reserve> reserveList(String shopCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reserve> reserveListByDesigner(String shopCode, String designer_name) {
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("shopCode", shopCode);
		map.put("designer_name", designer_name);
		List<Reserve> list = null;
		try {
			list = session.selectList("reserveListByDesigner", map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Reserve> reserveListByUser(String user_id) {
		SqlSession session = factory.openSession();
		List<Reserve> list = null;
		try {
			list = session.selectList("reserveListByUser", user_id);
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<Reserve> designerSearchByName(String shopCode, String designer_name, String days) {
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("shopCode", shopCode);
		map.put("designer_name", designer_name);
		map.put("days", days);
		List<Reserve> list = null;
		try {
			list = session.selectList("reserveDesignerSearchByName", map);
		} finally {
			session.close();
		}
		return list;
	}

	
}
