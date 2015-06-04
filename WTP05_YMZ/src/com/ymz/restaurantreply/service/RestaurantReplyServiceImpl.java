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
		dao.insertRestaurantReply(restaurantReply);
		dao.updateReplyCount(restaurantReply.getRestaurantNo());
	}

	// 수정하기
	@Override
	public void modifyRestaurantReply(RestaurantReply restaurantReply) {
		dao.updateRestaurantReply(restaurantReply);

	}

	// 삭제하기
	@Override
	public void removeRestaurantReplyByReplyNo(int number) {
		dao.deleteRestaurantReplyByReplyNo(number);

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