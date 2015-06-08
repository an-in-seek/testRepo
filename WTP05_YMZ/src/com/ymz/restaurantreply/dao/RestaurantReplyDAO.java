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
//게시물 수정- 평점 변동	
	public abstract double ModifyUpdateScore(double score, int restaurantNo);
	
	// 게시물 삭제
	public abstract void deleteRestaurantReply(int number, String userId);
	//게시물 갯수 삭제
	public abstract void updateReplyCount2(int restaurantNo);
	
	
	// 게시물 신고
	public abstract int reportRestaurantReplyByReplyNo(int number);

	//댓글 번호로 댓글찾기
	public abstract RestaurantReply selectRestaurantReplyByReplyNo(int number);
	//댓글 리스트 조회
	public abstract List selectAllRestaurantReply(int restNumber);
	//댓글 평점
	public abstract int selectScore(int restaurantNo);
	//평점- 댓글 몇개인지
	public abstract int selectReplyCount(int restaurantNo);
	//평점 - 맛집정보 리스트에 나오는 평점
	public abstract double updateScore(double score, int restaurantNo);
}
