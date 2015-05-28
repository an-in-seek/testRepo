package com.ymz.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Restaurant;
import com.ymz.review.dao.ReviewDAO;
import com.ymz.review.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	
	/**
	 * 리뷰 등록
	 */
	@Override
	public void registerReview(Review review) {
		dao.insertReview(review);
	}

	/**
	 * 리뷰 수정
	 */
	@Override
	public void modifyReview(Review review) {
		dao.updateReview(review);
	}


	/**
	 * 리뷰 삭제
	 */
	@Override
	public void removeReview(int num) {
		dao.deleteReview(num);
	}

	/**
	 * 리뷰 목록 - 페이징
	 */
	@Override
	public Map<String, Object> getReviewListPaging(int currentPage) {
		List<Review> list = dao.selectAllReviewPaging(currentPage);
		int totalContent = dao.selectTotalReviewCount();
		PagingBean pagingBean = new PagingBean(totalContent, currentPage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewList", list);
		map.put("pagingBean", pagingBean);
		return map;
	}

}
