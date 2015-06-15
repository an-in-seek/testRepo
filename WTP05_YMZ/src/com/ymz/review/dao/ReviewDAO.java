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

	
	//게시물 ID번호로 조회
	public abstract Review selectReviewByNo(int reviewNo);
	
	// 리뷰 전체 페이지 수
	public abstract int selectTotalReviewCount(String searchType, String query, String category);

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

	// 정렬
	public abstract List<Review> selectSortReviewPaging(int pageNo, String type, String searchType, String query, String category);

	// 공지글 가져오기
	public abstract List<Review> selectNotice();

	// 메인 베스트 리뷰
	public abstract List<Review> selectReviewTop5();

	// 이번달 최다 리플글 가져오기
	List<Review> selectMonthReply();

	//회원 아이디(ID)로 리뷰 게시물 리스트 조회하기
	List<Review> selectReviewById(int pageNo, String memberId);

	//회원 아이디(ID)와 일치하는 리뷰 게시물 총 개수
	public abstract int selectReviewCountById(String memberId);


	
}
