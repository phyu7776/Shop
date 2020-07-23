package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;
import com.shop.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{

	
	@Inject
	private ShopDAO dao;
	
	@Override
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception {
		
		int cateCodeRef = 0;
		
		if(level == 1) {
			cateCodeRef = cateCode;
			return dao.list(cateCode,cateCodeRef);
		}else {
			
			return dao.list(cateCode);
		}

	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.goodsView(gdsNum);
	}

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.registReply(reply);
	}

	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyList(gdsNum);
	}

	@Override
	public String idCheck(int repNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(repNum);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyReply(reply);
	}
	

}
