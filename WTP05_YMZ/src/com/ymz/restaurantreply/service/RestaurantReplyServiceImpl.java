package com.ymz.restaurantreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.restaurantreply.dao.RestaurantReplyDAO;
import com.ymz.restaurantreply.vo.RestaurantReply;

@Service
public class RestaurantReplyServiceImpl implements RestaurantReplyService {

	@Autowired
	private RestaurantReplyDAO dao;

	// 등록하기
	@Override
	@Transactional
	public void registerRestaurantReply(RestaurantReply restaurantReply) {
		System.out.println(restaurantReply);
		dao.insertRestaurantReply(restaurantReply);
		dao.updateReplyCount(restaurantReply.getRestaurantNo());
	
		int sum =dao.selectScore(restaurantReply.getRestaurantNo());
		int replyCount=dao.selectReplyCount(restaurantReply.getRestaurantNo());
		double score =(double) sum/replyCount;
		dao.updateScore(score, restaurantReply.getRestaurantNo());
		}

	// 수정하기
	@Override
	public void modifyRestaurantReply(RestaurantReply restaurantReply) {
		dao.updateRestaurantReply(restaurantReply);
		//평점수정
		int sum =dao.selectScore(restaurantReply.getRestaurantNo());
		int replyCount=dao.selectReplyCount(restaurantReply.getRestaurantNo());
		double score =(double) sum/replyCount;
		dao.ModifyUpdateScore(score, restaurantReply.getRestaurantNo());
	}

	// 삭제하기
	@Override
	public void removeRestaurantReply(RestaurantReply restaurantReply,int number, String userId) {
		dao.deleteRestaurantReply(number,userId);
		dao.updateReplyCount2(restaurantReply.getRestaurantNo());

	}

	// 조회하기
	@Override
	public RestaurantReply selectRestaurantReplyByReplyNo(int number) {

		return dao.selectRestaurantReplyByReplyNo(number);
	}

	// 댓글 리스트 조회하기

	@Override
	public List selectAllRestaurantReply(int restNumber) {

		return dao.selectAllRestaurantReply(restNumber);
	}

	// 송이꺼

}