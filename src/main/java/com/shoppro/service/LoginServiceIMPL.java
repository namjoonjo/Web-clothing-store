package com.shoppro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppro.dao.loginDAO;
import com.shoppro.domain.memberVO;

@Service
public class LoginServiceIMPL implements LoginService{
	
	@Autowired
	private loginDAO logindao;
	
	public memberVO loginServiceMethod(memberVO login) throws Exception{
		return logindao.getLoginResult(login);
	}
	public void signUpMethod(memberVO info) throws Exception{
		logindao.SignUp(info);
	}
	
	public int isitoverlapId(String memid) throws Exception{
		return logindao.checkoverlapID(memid);
	}
	public memberVO findID(memberVO memvo) throws Exception {
		// TODO Auto-generated method stub
		return logindao.findID(memvo);
	}
	
	public memberVO findPS(memberVO memvo) throws Exception {
		// TODO Auto-generated method stub
		return logindao.findPS(memvo);
	}
	
	
}
