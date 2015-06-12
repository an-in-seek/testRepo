package com.ymz.review.service;

import java.util.Map;

import com.ymz.review.vo.Review;

public interface ReviewService {
	
	// 리뷰 등록
	public abstract void registerReview(Review review);
	
	// 리뷰 수정
	public abstract void modifyReview(Review review);
	
	// 리뷰 삭제
	public abstract void removeReview(Review review);
	

	// 리뷰 조회
	public abstract Review getReviewByNo(int reviewNo);

	// 리뷰 추천 테이블 값 가져오기
	public abstract int getRecommendCount(Map rmap);

	// 리뷰 추천
	public abstract void recommendReview(int reviewNo);

	// 리뷰 조회수 증가
	public abstract void updateHitsReview(int reviewNo);

	// 리뷰 추천 등록 (추천테이블)
	public abstract void inputRecommend(Map rmap);

	// 리뷰 정렬 관련
	public abstract Map<String, Object> ReviewSortListPaging(int pageNo, String type, String searchType, String query);

	// 메인페이지 (월간 BEST)
	public Map getMainReview();
	
	
}
