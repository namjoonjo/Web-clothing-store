package com.shoppro.dao;

import com.shoppro.domain.memberVO;

public interface loginDAO {
	public memberVO getLoginResult(memberVO login) throws Exception;
	public void SignUp(memberVO info) throws Exception;
	public int checkoverlapID(String memid) throws Exception;
	public memberVO findID(memberVO memvo) throws Exception;
	public memberVO findPS(memberVO memvo) throws Exception;

}
