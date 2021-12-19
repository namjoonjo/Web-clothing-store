package com.shoppro.dao;

import java.util.List;

import com.shoppro.domain.itemVO;

public interface adminDAO {
	public int itemRegit(itemVO VO) throws Exception;
	public List<itemVO> itemList() throws Exception;
}
