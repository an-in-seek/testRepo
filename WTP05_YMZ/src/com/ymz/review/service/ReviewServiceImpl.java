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

	/**
	 * 리뷰 정렬 
	 */
	@Override
	public Map<String, Object> ReviewSortListPaging(int pageNo, String type, String searchType, String query) {
		List<Review> bestHits = dao.selectTodayBestHits(); // 오늘 최고 조회수 글 목록 가져오기
		List<Review> bestMonthHits = dao.selectMonthBestHits(); // 오늘 최고 조회수 글 목록 가져오기
		List<Review> notices = dao.selectNotice(); // 공지글 가져오기
		// 목록에 뿌려질 List<Review> 조회
		List<Review> sortlist = dao.selectSortReviewPaging(pageNo, type, searchType, query); // 수정 매개변수 추가
		// PagingBean 생성
		int totalContent = dao.selectTotalReviewCount(searchType, query); // 수정 : 매개변수 추가
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		// 두개의 값(List, PagingBean)을 Map에 넣어 return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notices", notices);
		map.put("reviewList", sortlist);
		map.put("pagingBean", pagingBean);
		map.put("todayBest", bestHits);
		map.put("monthBest", bestMonthHits);
		map.put("sortType", type);
		map.put("searchType", searchType);
		map.put("query", query);
		return map;
	}
	
	

}
