package com.leafqun.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.leafqun.entity.Login;
import com.leafqun.mapper.LoginMapper;
import com.leafqun.service.LoginService;

public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	public Login selectByPrimaryKey(String username) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectByPrimaryKey(username);
	}

	@Override
	public int insert(Login record) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.insert(record);
	}
	
}
