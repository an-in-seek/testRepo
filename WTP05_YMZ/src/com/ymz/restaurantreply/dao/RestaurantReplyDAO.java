package com.ymz.restaurantreply.dao;

import com.ymz.restaurantreply.vo.RestaurantReply;

public interface RestaurantReplyDAO {

	// 게시물 등록
	public abstract int insertRestauran_reply(
			RestaurantReply restaurant_reply);

	// 게시물 수정
	public abstract int updateRestauran_reply(RestaurantReply restaurantReaply);

	// 게시물 삭제
	public abstract int deleteRestaurant_replyByReplyNo(int ReplyNo);

	// 게시물 신고
	public abstract int reportRestaurant_replyByReplyNo(int ReplyNo);

	// 게시물 평점
	public abstract int gardeRestaurant_replyByReplyNo(int ReplyNo);
}
