package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
import com.shop.persistence.AdminDAO;
 
@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	@Override
	public void register(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
		
	}

	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스");
		return dao.goodslist();
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.goodsView(gdsNum);
	}
	
	//수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.goodsModify(vo);
	}

	//상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.goodsDelete(gdsNum);
	}

	@Override
	public List<OrderVO> orderList() throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		dao.delivery(order);
	}

	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		// TODO Auto-generated method stub
		dao.changeStock(goods);
	}

	@Override
	public List<ReplyListVO> allReply() throws Exception {
		// TODO Auto-generated method stub
		return dao.allReply();
	}

	@Override
	public void deleteReply(int repNum) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(repNum);
	}

}