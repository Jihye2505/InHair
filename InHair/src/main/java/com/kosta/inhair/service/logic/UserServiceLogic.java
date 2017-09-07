package com.kosta.inhair.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.UserDAO;
import com.kosta.inhair.domain.User;
import com.kosta.inhair.service.UserService;

@Service
public class UserServiceLogic implements UserService {
	
	@Autowired
	UserDAO userDAO;

	@Override
	public int userCreate(User user) {
		return userDAO.userCreate(user);
	}

	@Override
	public int userUpdate(User user) {
		// TODO Auto-generated method stub
		return userDAO.userUpdate(user);
	}

	@Override
	public int userDelete(String id, String password) {
		// TODO Auto-generated method stub
		User user = userDAO.userSearch(id);
		
		if (password.equals(user.getPassword())) {
			userDAO.userDelete(id, password);
		}
		return 0;
	}

	@Override
	public User userSearch(String id) {
		// TODO Auto-generated method stub
		return userDAO.userSearch(id);
	}

	@Override
	public boolean idCheck(String id) {
		return userDAO.idCheck(id);
	}

	@Override
	public boolean login(String id, String password) {
		User user = userDAO.userSearch(id);
//		user가 있다면 id 검증, password가 동일하다면 존재하는 유저
		if(user != null && user.getPassword().equals(password)){
			return true;
		}
		return false;
	}

}
