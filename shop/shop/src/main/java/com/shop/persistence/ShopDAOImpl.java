package com.shop.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

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

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".registReply", reply);
		
	}
	
	// 주문 목록
		@Override
		public List<OrderVO> orderList(OrderVO order) throws Exception {
			return sql.selectList(namespace + ".orderList", order);
		}

	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".replyList",gdsNum);
	}

	@Override
	public String idCheck(int repNum) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".replyUserIdCheck",repNum);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteReply",reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modifyReply",reply);
	}

	@Override
	public void addCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".addCart",cart);
	}

	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".cartList",userId);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteCart",cart);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}
	
	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".cartAllDelete",userId);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".orderView",order);
	}


}
