package com.shop.persistence;

import java.util.List;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

public interface ShopDAO {

	//카테고리 1차 분류
	public List<GoodsViewVO> list(int cateCode,int cateCodeRef) throws Exception;
	
	//카테고리 2차 분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품 소감(댓글) 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	//카드 담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//카트삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	// 주문 정보
	public void orderInfo(OrderVO order) throws Exception;
	
	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	//카트 비우기
	public void cartAllDelete(String userId) throws Exception;
	
	// 주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
}