package com.shop.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import com.shop.domain.GoodsViewVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ShopDAOImpl implements ShopDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.shop.mappers.shopMapper";

	//1차분류
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		map.put("cateCode",cateCode);
		map.put("catrCodeRef",cateCodeRef);
		
		return sql.selectList(namespace +".list_1",map);
	}
	
	//2차분류
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list_2", cateCode);
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".goodsView",gdsNum);
	}

}
