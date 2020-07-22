package com.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;
import com.shop.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Inject
	ShopService service;
				
	// 카테고리별 상품 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,@RequestParam("l") int level, Model model) throws Exception {
		logger.info("get list");
		
		List<GoodsViewVO> list = null;
		list = service.list(cateCode, level);
	
		model.addAttribute("list", list);	
	}
	
	//상품 조회
	@RequestMapping(value = "/view",method = RequestMethod.GET)
	public void getView(@RequestParam("n")int gdsNum,Model model) throws Exception{
		logger.info("get view");
		
		GoodsViewVO view = service.goodsVIew(gdsNum);
		model.addAttribute("view",view);
		
		List<ReplyListVO> reply = service.replyList(gdsNum);
		model.addAttribute("reply",reply);
	}
	
	//댓글
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String registReply(ReplyVO reply, HttpSession session) throws Exception {
	 logger.info("regist reply");
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 reply.setUserId(member.getUserId());
	 
	 service.registReply(reply);
	 
	 return "redirect:/shop/view?n=" + reply.getGdsNum();
	}
}
