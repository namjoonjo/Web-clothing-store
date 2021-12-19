package com.shoppro.dao;

import java.util.List;
import java.util.Map;

import com.shoppro.domain.itemVO;

public interface itemDAO {
	public List<itemVO> allofgetbestitems() throws Exception;	//모든아이템 중에서 제일 많이 팔린 아이템 목록 가져오기
	public List<itemVO> kindofgetbestitems(String itemgenre) throws Exception;	//한 종류에서 제일 많이 팔린 아이템 가져오기
	public itemVO getitemDetails(int itemid) throws Exception;	//item 세부사항 가져오기
	
}
