package com.ymz.restaurantreply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.restaurantreply.vo.RestaurantReply;

@Repository
public class RestaurantReplyDAOImpl implements RestaurantReplyDAO{

	private String namespace="restaurantReply.dao.RestaurantReplyMapper.";
	@Autowired
	private SqlSessionTemplate session;
	
	//등록하기
	@Override
	public int insertRestaurantReply(RestaurantReply restaurantReply) {
		
		return session.insert(namespace+"insertRestaurantReply", restaurantReply);
	}

	//조회하기
	@Override
	public int updateRestaurantReply(RestaurantReply restaurantReply) {
		
		return session.update(namespace+"updateRestaurantReply", restaurantReply);
	}

	//삭제하기
	@Override
	public int deleteRestaurantReplyByReplyNo(int number) {
	
		return session.delete(namespace+"deleteRestaurantReplyByReplyNo", number);
	}

	//신고하기
	@Override
	public int reportRestaurantReplyByReplyNo(int number) {
		
		return session.selectOne(namespace+"reportRestaurantReplyByReplyNo",number);
	}

	
	//평가하기
	@Override
	public int gardeRestaurantReplyByReplyNo(int number) {
		
		return session.selectOne(namespace+"gardeRestaurantReplyByReplyNo",number);
	}

	//댓글 번호로 댓글찾기
	@Override
	public RestaurantReply selectRestaurantReplyByReplyNo(int number) {
		
		return session.selectOne(namespace+"selectRestaurantReplyByReplyNo", number);
	}

	@Override
	public List selectAllRestaurantReply(int restNumber) {
			return session.selectList(namespace+"selectAllRestaurantReply", restNumber);
	}
	
}
