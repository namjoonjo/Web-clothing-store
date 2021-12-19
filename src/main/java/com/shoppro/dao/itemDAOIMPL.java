package com.shoppro.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppro.domain.itemVO;

@Repository
public class itemDAOIMPL implements itemDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace="com.shoppro.mapper.mainMapper";
	
	public List<itemVO> allofgetbestitems() throws Exception {
		// TODO Auto-generated method stub
		List<itemVO> allofbestitems=new ArrayList<itemVO>();
		allofbestitems=sqlsession.selectList(namespace+".allofgetbestitem");
		return allofbestitems;
	}

	public List<itemVO> kindofgetbestitems(String itemgenre) throws Exception {
		List<itemVO> kindofbestitems=new ArrayList<itemVO>();
		Map<String,String> map=new HashMap<String,String>();
		map.put("itemgenre", itemgenre);
		kindofbestitems=sqlsession.selectList(namespace+".kindofgetbestitem",map);
		return kindofbestitems;
	}

	@Override
	public itemVO getitemDetails(int itemid) throws Exception {
		itemVO itemDetails=new itemVO();
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("itemid", itemid);
		itemDetails=sqlsession.selectOne(namespace+".getitemDetails",map);
		return itemDetails;
	}

}
