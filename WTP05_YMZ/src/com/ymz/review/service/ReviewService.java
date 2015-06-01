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
	
	// 리뷰 목록
	public abstract Map<String, Object> getReviewListPaging(int currentPage);

	// 리뷰 조회
	public abstract Review getReviewByNo(int reviewNo);
	
	
}
