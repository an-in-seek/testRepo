package com.ymz.restaurantreply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.restaurantreply.vo.RestaurantReply;

@Repository
public class RestaurantReplyDAOImpl implements RestaurantReplyDAO {

	private String namespace = "restaurantReply.dao.RestaurantReplyMapper.";
	@Autowired
	private SqlSessionTemplate session;

	// 등록하기
	@Override
	public int insertRestaurantReply(RestaurantReply restaurantReply) {
		return session.insert(namespace + "insertRestaurantReply",	restaurantReply);
	}

	// 수정하기
	@Override
	public int updateRestaurantReply(RestaurantReply restaurantReply) {
		return session.update(namespace + "updateRestaurantReply",	restaurantReply);
	}

	// 삭제하기
	@Override
	public void deleteRestaurantReply(int number, String userId) {
		Map map = new HashMap();
		map.put("number", number);
		map.put("memberId", userId);
		session.delete(namespace + "deleteRestaurantReply", map);
	}

	// 게시물 댓글 개수 -1

	@Override
	public void updateReplyCount2(int restaurantNo) {
		session.update(namespace + "updateReplyCount2", restaurantNo);

	}

	// 신고하기
	@Override
	public int reportRestaurantReplyByReplyNo(int number) {
		return session.selectOne(namespace + "reportRestaurantReplyByReplyNo", number);
	}

	// 댓글 번호로 댓글찾기
	@Override
	public RestaurantReply selectRestaurantReplyByReplyNo(int number) {

		return session.selectOne(namespace + "selectRestaurantReplyByReplyNo",
				number);
	}

	@Override
	public List selectAllRestaurantReply(int restNumber) {
		return session.selectList(namespace + "selectAllRestaurantReply",
				restNumber);
	}

	// 댓글 카운트하기
	@Override
	public int updateReplyCount(int restaurantNo) {

		return session.update(namespace + "updateReplyCount", restaurantNo);

	}

	@Override
	public int selectScore(int restaurantNo) {
		return session.selectOne(namespace + "selectScore", restaurantNo);
	}

	// 댓글 갯수세기
	@Override
	public int selectReplyCount(int restaurantNo) {

		return session.selectOne(namespace + "selectReplyCount", restaurantNo);
	}

	// 댓글 평점
	@Override
	public double updateScore(double score, int restaurantNo) {

		Map map = new HashMap();
		map.put("score", score);
		map.put("restaurantNo", restaurantNo);
		return session.update(namespace + "updateScore", map);
	}



}
