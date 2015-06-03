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
	public void removeReview(Review review) {
		dao.deleteReview(review);
	}

	/**
	 * 전체 회원 목록 조회 처리 - Paging 처리
	 *  - 목록에 뿌려줄 리뷰리스트(List<Review>)와 페이징 처리를 PagingBean 객체를 생성해 Map에 넣어 리턴
	 * @param page : 조회할 page 번호
	 * @return Map
	 */
	@Override
	public Map<String, Object> getReviewListPaging(int pageNo) {
		// 목록에 뿌려질 List<Review> 조회
		List<Review> list = dao.selectAllReviewPaging(pageNo);
		// PagingBean 생성
		int totalContent = dao.selectTotalReviewCount();
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		// 두개의 값(List, PagingBean)을 Map에 넣어 return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewList", list);
		map.put("pagingBean", pagingBean);
		return map;
	}

	/**
	 * 리뷰 번호로 조회
	 */
	@Override
	public Review getReviewByNo(int reviewNo) {
		Review review = dao.selectReviewByNo(reviewNo);
		return review;
	}
	
	
	/**
	 * 리뷰 추천 테이블에서 값 조회
	 */
	@Override
	public int getRecommendCount(Map rmap) {
		return dao.getRecommendCount(rmap);
	}
	
	/**
	 * 리뷰 추천 등록
	 */
	@Override
	public void inputRecommend(Map rmap) {
		dao.inputRecommend(rmap);
	}
	
	/**
	 * 리뷰 추천
	 */
	public void recommendReview(int reviewNo){
		dao.recommendReview(reviewNo);
	}

	/**
	 * 리뷰 조회수 증가
	 */
	public void updateHitsReview(int reviewNo){
		dao.updateHitsReview(reviewNo);
	}

}
