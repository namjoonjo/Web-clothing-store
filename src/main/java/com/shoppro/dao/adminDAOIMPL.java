package com.shoppro.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppro.domain.itemVO;

@Repository
public class adminDAOIMPL implements adminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.shoppro.mapper.adminMapper";
	
	//sequence : auto_cartid.nextval
	//sequence : auto_orderid.nextval
	//sequence : auto_itemid.nextval
	public int itemRegit(itemVO itemvo) throws Exception{
		int num=sqlSession.insert(namespace+".itemRegit",itemvo);
		return num;
	}

	
	public List<itemVO> itemList() throws Exception {
		List<itemVO> itemlist=new ArrayList<itemVO>();
		itemlist=sqlSession.selectList(namespace+".getitemlist");
		return itemlist;
	}
}
