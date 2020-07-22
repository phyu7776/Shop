package com.shop.service;

import java.util.List;

import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

public interface ShopService {
	
	//상품리스트
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception;
	
	//상품 상세 보기
	public GoodsViewVO goodsVIew(int gdsNum) throws Exception;
	
	//댓글 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
}
