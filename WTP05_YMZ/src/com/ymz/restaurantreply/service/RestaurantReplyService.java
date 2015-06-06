package com.ymz.restaurantreply.service;

import java.util.List;
import java.util.Map;

import com.ymz.restaurantreply.vo.RestaurantReply;

public interface RestaurantReplyService {
     //송이꺼
	
	  // 등록
	public abstract void registerRestaurantReply(RestaurantReply restaurantReply);

	
		//수정
	public abstract void modifyRestaurantReply(int number, String userId);
		//삭제
	void removeRestaurantReply(int number, String userId);
		//조회
	RestaurantReply selectRestaurantReplyByReplyNo(int number);
	//댓글리스트 조회
	public abstract List selectAllRestaurantReply(int restNumber);


	

		// 게시물 신고

		// 게시물 평점
}
