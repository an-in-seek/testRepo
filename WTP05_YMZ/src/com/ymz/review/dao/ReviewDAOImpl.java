package com.ymz.review.dao;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.review.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSessionTemplate session;
	private String namespace = "review.dao.ReviewMapper.";
	
	
	/**
	 * 리뷰 등록
	 */
	@Override
	public void insertReview(Review review) {
		session.insert(namespace+"insertReview", review);
	}

	/**
	 * 리뷰 수정
	 */
	@Override
	public void updateReview(Review review) {
		session.update(namespace+"updateReview", review);
	}

	/**
	 * 리뷰 삭제
	 */
	@Override
	public void deleteReview(Review review) {
		System.out.println(review);
		session.delete(namespace+"deleteReview", review);
	}

	
	/**
	 * 리뷰 추천테이블에서 값 조회
	 */
	@Override
	public int getRecommendCount(Map rmap) {
		return session.selectOne(namespace+"selectRecommendReview", rmap);
	}
	
	
	/**
	 * 리뷰 추천수 등록
	 */
	@Override
	public void inputRecommend(Map rmap) {
		session.insert(namespace+"insertRecommendReview", rmap);
	}

	/**
	 * 리뷰 추천
	 */
	public void recommendReview(int reviewNo){
		session.update(namespace+"recommendReview", reviewNo);
	}
	
	/**
	 * 리뷰 조회
	 */
	@Override
	public Review selectReviewByNo(int reviewNo) {
		return session.selectOne(namespace + "selectReviewByNo", reviewNo);
	}

	/**
	 * 리뷰 조회수 증가
	 * @return 
	 */
	public void updateHitsReview(int reviewNo){
		session.update(namespace + "updateHits", reviewNo);
	}

	/**
	 * 오늘 최고 조회수글 가져오기
	 */
	@Override
	public List<Review> selectTodayBestHits() {
		SimpleDateFormat td = new SimpleDateFormat("yyyy-MM-dd");
		String today = td.format(new Date());
		return session.selectList(namespace+"selectTodayBestHits", today);
	}

	/**
	 * 이번달 최고 조회수글 가져오기
	 */
	@Override
	public List<Review> selectMonthBestHits() {
		SimpleDateFormat td = new SimpleDateFormat("yyyy-MM");
		String month = td.format(new Date());
		return session.selectList(namespace+"selectMonthBestHits", month);
	}
	
	/**
	 * 이번달 최고 리플글 가져오기
	 */
	@Override
	public List<Review> selectMonthReply() {
		SimpleDateFormat td = new SimpleDateFormat("yyyy-MM");
		String month = td.format(new Date());
		return session.selectList(namespace+"selectMonthReply", month);
	}
	
	/**
	 * 회원 아이디(ID)로 리뷰 게시물 리스트 조회하기
	 */
	@Override
	public List<Review> selectReviewById(int pageNo, String memberId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return session.selectList(namespace+"selectReviewById", map);
	}
	
	@Override
	public int selectReviewCountById(String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);  
		return session.selectOne(namespace+"selectReviewCountById", map);
	}

	/**
	 * 리뷰 정렬 페이징 관련
	 */
	@Override
	public List<Review> selectSortReviewPaging(int pageNo, String type, String searchType, String query, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		map.put("sortType", type);  
		map.put("searchType", searchType);  
		map.put("query", query);  
		map.put("category", category);
		return session.selectList(namespace+"ReviewSortPaging", map);
	}
	
	/**
	 * 리뷰 전체 페이지 수
	 */
	@Override
	public int selectTotalReviewCount(String searchType, String query, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);  
		map.put("query", query); 
		map.put("category", category);
		if(searchType.equals("")&&query.equals("")&&category.equals("")){
			return session.selectOne(namespace+"selectTotalReviewCount");
		}
		return session.selectOne(namespace+"selectSearchReviewCount", map);
		
	}

	/**
	 * 공지글 가져오기
	 */
	@Override
	public List<Review> selectNotice() {
		return session.selectList(namespace+"selectNotice");
	}

	
	/**
	 * 메인 베스트 (월간)
	 */
	@Override
	public List<Review> selectReviewTop5() {
		SimpleDateFormat td = new SimpleDateFormat("yyyy-MM");
		String month = td.format(new Date());
		return session.selectList(namespace+"selectMonthBestHits", month);
	}

	


	
	
}
