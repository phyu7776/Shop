package com.shop.service;

import java.util.List;

import com.shop.domain.GoodsViewVO;

public interface ShopService {

	public List<GoodsViewVO> list(int cateCode,int level) throws Exception;
	
	public GoodsViewVO goodsVIew(int gdsNum) throws Exception;
}
