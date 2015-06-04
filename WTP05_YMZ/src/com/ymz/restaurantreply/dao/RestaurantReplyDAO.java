package com.ymz.restaurantreply.dao;

import java.util.List;

import com.ymz.restaurantreply.vo.RestaurantReply;

public interface RestaurantReplyDAO {

	// 게시물 등록
	public abstract int insertRestaurantReply(
			RestaurantReply restaurantReply);
	//리플개수 보여주기
 public abstract int updateReplyCount(int restaurantNo);
	// 게시물 수정
	public abstract int updateRestaurantReply(RestaurantReply restaurantReply);
	// 게시물 삭제
	public abstract int deleteRestaurantReplyByReplyNo(int number);
	// 게시물 신고
	public abstract int reportRestaurantReplyByReplyNo(int number);
	// 게시물 평점
	public abstract int gardeRestaurantReplyByReplyNo(int number);
	//댓글 번호로 댓글찾기
	public abstract RestaurantReply selectRestaurantReplyByReplyNo(int number);
	//댓글 리스트 조회
	public abstract List selectAllRestaurantReply(int restNumber);
}
