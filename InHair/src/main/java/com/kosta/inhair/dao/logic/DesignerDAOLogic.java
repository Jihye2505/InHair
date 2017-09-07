package com.kosta.inhair.dao.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.kosta.inhair.dao.DesignerDAO;
import com.kosta.inhair.dao.SqlSessionFactoryProvider;
import com.kosta.inhair.domain.Designer;
import com.kosta.inhair.domain.HairShop;
import com.kosta.inhair.domain.User;

@Repository
public class DesignerDAOLogic implements DesignerDAO {
	
	private SqlSessionFactory factory;

	public DesignerDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public boolean shopCodeCheck(String shopCode) {
		SqlSession session = factory.openSession();
		HairShop hairshop = null;
		boolean check = false;
		
		try {
			hairshop = session.selectOne("shopCodeCheck", shopCode);
			if(hairshop != null)
				check = true;
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public int designerCreate(Designer designer) {
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.insert("designerCreate", designer);
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int designerUpdate(Designer designer) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try { 
			result = session.update("updateDesigner", designer);
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
	public Designer designerSearch(String designer_id) {
		SqlSession session = factory.openSession();
		Designer designer = null;
		try {
			designer = session.selectOne("designerSearch", designer_id);
		} finally {
			session.close();
		}
		return designer;
	}

	@Override
	public int designerDelete(String id, String password) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try { 
			result = session.update("deleteDesigner", id);
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
	public int designerOut(String id) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try { 
			result = session.update("designerOut", id);
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
	public List<Designer> designerList() {
		SqlSession session = factory.openSession();
		List<Designer> list = null;
		try {
			list = session.selectList("designerList");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Designer> designerListByAddress(String gu) {
		SqlSession session = factory.openSession();
		List<Designer> list = null;
		
		try {
			list = session.selectList("designerListByAddress", "%" + gu + "%");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public boolean idDesignerCheck(String id) {
		SqlSession session = factory.openSession();
		Designer designer = null;
		boolean check = false;
		
		try {
			designer = session.selectOne("idDesignerCheck", id);
			if(designer != null)
				check = true;
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public List<Designer> designerListByHairshop(String shopCode) {
		SqlSession session = factory.openSession();
		List<Designer> list = null;

		try {
			list = session.selectList("designerListByHairshop", shopCode);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Designer designerSearchByName(String shopCode, String designer_name) {
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("shopCode", shopCode);
		map.put("designer_name", designer_name);
		Designer designer = null;
		try {
			designer = session.selectOne("designerSearchByName", map);
		} finally {
			session.close();
		}
		return designer;
	}

	@Override
	public List<Designer> designerListByDate(String shopCode, String days) {
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("days", days);
		List<Designer> list = null;

		try {
			list = session.selectList("designerListByDate", map);
		} finally {
			session.close();
		}
		return list;
	}

}
