package com.ymz.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Restaurant;
import com.ymz.review.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSessionTemplate session;
	private String namespace = "review.dao.ReviewMapper.";
	
	
	/**
	 * 리뷰 등록
	 */
	@Override
	public void insertReview(Review review) {
		session.insert(namespace+"insertReview", review);
	}

	/**
	 * 리뷰 수정
	 */
	@Override
	public void updateReview(Review review) {
		session.update(namespace+"insertReview", review);
	}

	/**
	 * 리뷰 삭제
	 */
	@Override
	public void deleteReview(int num) {
		session.delete(namespace+"insertReview", num);
	}

	
	/**
	 * 리뷰 목록
	 */
	@Override
	public List<Review> selectAllReviewPaging(int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("currentPage", currentPage);
		return session.selectList(namespace+"selectAllReviewPaging", map);
	}

	/**
	 * 리뷰 전체 페이지 수
	 */
	@Override
	public int selectTotalReviewCount() {
		return session.selectOne(namespace+"selectTotalReviewCount");
	}

	
}
