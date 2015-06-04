package com.ymz.review.dao;

import java.util.List;
import java.util.Map;

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

	// 리뷰 추천테이블에서 값 조회
	public abstract int getRecommendCount(Map rmap);

	// 리뷰 추천
	public abstract void recommendReview(int reviewNo);

	// 리뷰 조회수 증가
	public abstract void updateHitsReview(int reviewNo);

	// 리뷰 추천수 등록
	public abstract void inputRecommend(Map rmap);

	// 오늘 최고 조회수글 가져오기
	public abstract List<Review> selectTodayBestHits();

	// 이번달 최고 조회수글 가져오기
	public abstract List<Review> selectMonthBestHits();

	
}
