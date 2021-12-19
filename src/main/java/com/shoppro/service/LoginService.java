package com.shoppro.service;

import com.shoppro.domain.memberVO;

public interface LoginService {
	public memberVO loginServiceMethod(memberVO login) throws Exception;
	public void signUpMethod(memberVO info) throws Exception;
	public int isitoverlapId(String memid) throws Exception;
	public memberVO findID(memberVO memvo) throws Exception;
	public memberVO findPS(memberVO memvo) throws Exception;
}
