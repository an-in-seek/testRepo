package com.ymz.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.common.util.PagingBean;
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
	@Transactional
	public void registerReview(Review review) {
		dao.insertReview(review);
	}

	/**
	 * 리뷰 수정
	 */
	@Override
	@Transactional
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
	@Transactional
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
	 * 회원 아이디(ID)로 리뷰게시물 조회하기
	 */
	@Override
	public Map<String, Object> getReviewListPagingById(int pageNo, String memberId) {
		List<Review> list = dao.selectReviewById(pageNo, memberId); // 오늘 최고 조회수 글 목록 가져오기
		int totalContent = dao.selectReviewCountById(memberId); // 수정 : 매개변수 추가
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		// 두개의 값(List, PagingBean)을 Map에 넣어 return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pagingBean", pagingBean);
		return map;
	}
	
	/**
	 * 리뷰 정렬 
	 */
	@Override
	public Map<String, Object> ReviewSortListPaging(int pageNo, String type, String searchType, String query, String category) {
		List<Review> bestHits = dao.selectTodayBestHits(); // 오늘 최고 조회수 글 목록 가져오기
		List<Review> bestMonthHits = dao.selectMonthBestHits(); // 오늘 최고 조회수 글 목록 가져오기
		List<Review> bestMonthReplys = dao.selectMonthReply(); // 이번달 최다 리플글 가져오기.
		List<Review> notices = dao.selectNotice(); // 공지글 가져오기
		// 목록에 뿌려질 List<Review> 조회
		List<Review> sortlist = dao.selectSortReviewPaging(pageNo, type, searchType, query, category); // 수정 매개변수 추가
		// PagingBean 생성
		int totalContent = dao.selectTotalReviewCount(searchType, query, category); // 수정 : 매개변수 추가
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		// 두개의 값(List, PagingBean)을 Map에 넣어 return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notices", notices);
		map.put("monthReplyList", bestMonthReplys);
		map.put("reviewList", sortlist);
		map.put("pagingBean", pagingBean);
		map.put("todayBest", bestHits);
		map.put("monthBest", bestMonthHits);
		map.put("sortType", type);
		map.put("searchType", searchType);
		map.put("query", query);
		map.put("category", category);
		return map;
	}
	
	
	/**
	 * 메인 페이지 BEST 리뷰
	 */
	@Override
	public Map<String, Object> getMainReview() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Review> list = dao.selectReviewTop5();		// 월간 베스트
		List<Review> bestHits = dao.selectTodayBestHits(); // 오늘 최고 조회수 글 목록 가져오기
		map.put("monthBest", list);
		map.put("todayBest", bestHits);
		return map;
	}



}
