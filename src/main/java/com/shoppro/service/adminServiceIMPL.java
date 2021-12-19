package com.shoppro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppro.dao.adminDAO;
import com.shoppro.domain.itemVO;

@Service
public class adminServiceIMPL implements adminService{

	@Autowired
	private adminDAO admindao;
	
	@Override
	public int itemRegit(itemVO itemvo) throws Exception {
		// TODO Auto-generated method stub
		int check=admindao.itemRegit(itemvo);
		return check;
	}
	@Override
	public List<itemVO> itemList() throws Exception {
		// TODO Auto-generated method stub
		return admindao.itemList();
	}

}
