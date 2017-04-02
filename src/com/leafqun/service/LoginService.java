package com.leafqun.service;

import com.leafqun.entity.Login;

public interface LoginService {
	
	public Login selectByPrimaryKey(String username) throws Exception;
	
	public  int insert(Login record) throws Exception;
}
