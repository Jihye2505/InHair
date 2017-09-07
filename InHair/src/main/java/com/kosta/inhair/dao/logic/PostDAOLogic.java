package com.kosta.inhair.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.kosta.inhair.dao.PostDAO;
import com.kosta.inhair.dao.SqlSessionFactoryProvider;
import com.kosta.inhair.domain.Post;


@Repository
public class PostDAOLogic implements PostDAO {

	private SqlSessionFactory factory;

	public PostDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int postCreate(Post post) {

		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.insert("postCreate", post);
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
	public int postUpdate(Post post) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			result = session.update("postUpdate", post);
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
	public int postDelete(int post_id) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			result = session.delete("postDelete", post_id);
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
	public Post postSearch(int post_id) {
		SqlSession session = factory.openSession();

		try {

			return session.selectOne("postSearch", post_id);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Post> postList(String designer_id) {
		SqlSession session = factory.openSession();
		List<Post> list = null;

		try {
			list = session.selectList("postList", designer_id);
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<Double> allStarpoint(String designer_id) {
	      SqlSession session = factory.openSession();
	      
	      try{
	      return session.selectList("allStarpoint", designer_id);
	      }finally{
	         session.close();
	      }
	}

}
