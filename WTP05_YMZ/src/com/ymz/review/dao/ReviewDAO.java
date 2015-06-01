package com.ymz.review.dao;

import java.util.List;

import com.ymz.qna.vo.QNA;
import com.ymz.restaurant.vo.Restaurant;
import com.ymz.review.vo.Review;

public interface ReviewDAO {
	
	// 리뷰 등록
	public abstract void insertReview(Review review);
	
	// 리뷰 수정
	public abstract void updateReview(Review review);
	
	// 리뷰 삭제
	public abstract void deleteReview(Review review);
	
	// 리뷰 목록
	public abstract List<Review> selectAllReviewPaging(int pageNo);
	
	//게시물 ID번호로 조회
	public abstract Review selectReviewByNo(int reviewNo);
	
	// 리뷰 전체 페이지 수
	public abstract int selectTotalReviewCount();

	// 리뷰 추천
	public abstract void recommendReview(Review review);
	
}
