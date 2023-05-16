package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.User;


@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	
}
