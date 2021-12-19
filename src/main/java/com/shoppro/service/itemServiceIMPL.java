package com.shoppro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppro.dao.itemDAO;
import com.shoppro.domain.itemVO;

@Service
public class itemServiceIMPL implements itemService{

	@Autowired
	private itemDAO itemdao;
	
	@Override
	public List<itemVO> allofgetbestitems() throws Exception {
		// TODO Auto-generated method stub
		return itemdao.allofgetbestitems();
	}

	@Override
	public List<itemVO> kindofgetbestitems(String itemgenre) throws Exception {
		// TODO Auto-generated method stub
		return itemdao.kindofgetbestitems(itemgenre);
	}

	public itemVO getitemDetails(int itemid) throws Exception{
		return itemdao.getitemDetails(itemid);
	}
	
}
