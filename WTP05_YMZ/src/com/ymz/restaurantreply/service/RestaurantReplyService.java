package com.ymz.restaurantreply.service;

import com.ymz.restaurantreply.vo.RestaurantReply;

public interface RestaurantReplyService {
     
	
	  // 게시물 등록

	public abstract void registerRestaurantReply(RestaurantReply restaurantReaply);
		// 게시물 수정
	public abstract void modifyRestaurantReply(RestaurantReply restaurantReaply);
	
		// 게시물 삭제
	public abstract void removeRestaurantReply(int ReplyNo);

		// 게시물 신고

		// 게시물 평점
}
