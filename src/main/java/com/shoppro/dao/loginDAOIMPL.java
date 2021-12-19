package com.shoppro.dao;




import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.shoppro.domain.memberVO;


@Repository
public class loginDAOIMPL implements loginDAO{

	@Autowired
	private SqlSession sqlsession;
	
	
	private static final String namespace="com.shoppro.mapper.userMapper";
	
	public memberVO getLoginResult(memberVO login) throws Exception{
		//namespace + ".<<id명칭>>"
		return sqlsession.selectOne(namespace+".getLoginResult", login);
	}
	public void SignUp(memberVO info) throws Exception{
		sqlsession.insert(namespace+".signUpResult",info);
	}
	public int checkoverlapID(String memid) throws Exception{
		return sqlsession.selectOne(namespace+".checkoverlapID",memid);
	}
	
	public memberVO findID(memberVO memvo) throws Exception{
		return sqlsession.selectOne(namespace+".findID",memvo);
	}
	public memberVO findPS(memberVO memvo) throws Exception{
		return sqlsession.selectOne(namespace+".findPS",memvo);
	}
}
