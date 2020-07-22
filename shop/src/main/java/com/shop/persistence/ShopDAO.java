package com.shop.persistence;

import java.util.List;

import com.shop.domain.GoodsViewVO;

public interface ShopDAO {

	//카테고리 1차 분류
	public List<GoodsViewVO> list(int cateCode,int cateCodeRef) throws Exception;
	
	//카테고리 2차 분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
}
