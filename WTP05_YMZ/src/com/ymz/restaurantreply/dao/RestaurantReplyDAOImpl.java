package com.ymz.restaurantreply.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.restaurantreply.vo.RestaurantReply;

@Repository
public class RestaurantReplyDAOImpl implements RestaurantReplyDAO{

	private String namespace="restaurant_reply.dao.RestauranReplyMapper.";
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertRestauran_reply(RestaurantReply restauran_reply) {
		
		return session.insert(namespace+"insertFAQ", restauran_reply);
	}

	@Override
	public int updateRestauran_reply(RestaurantReply restaurantReaply) {
		
		return session.update(namespace+"updateRestauran_reply", restaurantReaply);
	}

	@Override
	public int deleteRestaurant_replyByReplyNo(int ReplyNo) {
	
		return session.delete(namespace+"deleteRestaurant_replyByReplyNo", ReplyNo);
	}

	@Override
	public int reportRestaurant_replyByReplyNo(int ReplyNo) {
		
		return session.selectOne(namespace+"reportRestaurant_replyByReplyNo",ReplyNo);
	}

	@Override
	public int gardeRestaurant_replyByReplyNo(int ReplyNo) {
		
		return session.selectOne(namespace+"gardeRestaurant_replyByReplyNo",ReplyNo);
	}

	
	
	
}
