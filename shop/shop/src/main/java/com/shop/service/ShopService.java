package com.shop.service;

import java.util.List;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

public interface ShopService {
	
	//상품리스트
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception;
	
	//상품 상세 보기
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//댓글 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//아이디체크
	public String idCheck(int repNum) throws Exception;
	
	//댓글삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//댓글수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	//카트담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문 정보
	public void orderInfo(OrderVO order) throws Exception;
	
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	//카트 비우기
	public void cartAllDelete(String userId) throws Exception;
	
	// 주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
