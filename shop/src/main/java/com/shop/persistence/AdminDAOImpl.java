package com.shop.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "com.shop.mappers.adminMapper";

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}

	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".register", vo);
	}

	//상품리스트
	@Override
	public List<GoodsVO> goodslist() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".goodslist") ;
	}

	//상품목록
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	//수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".goodsModify", vo);
	}
	//삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}
	
}