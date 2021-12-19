package com.shoppro.service;

import java.util.List;

import com.shoppro.domain.itemVO;

public interface adminService {
	public int itemRegit(itemVO itemvo) throws Exception;
	public List<itemVO> itemList() throws Exception;
}
