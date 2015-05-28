package com.ymz.review.dao;

import java.util.List;

import com.ymz.restaurant.vo.Restaurant;
import com.ymz.review.vo.Review;

public interface ReviewDAO {
	
	// 리뷰 등록
	public abstract void insertReview(Review review);
	
	// 리뷰 수정
	public abstract void updateReview(Review review);
	
	// 리뷰 삭제
	public abstract void deleteReview(int num);
	
	// 리뷰 목록
	public abstract List<Review> selectAllReviewPaging(int pageNo);
	
	// 리뷰 전체 페이지 수
	public abstract int selectTotalReviewCount();
	
}
