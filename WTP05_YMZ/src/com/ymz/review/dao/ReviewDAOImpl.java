package com.ymz.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Restaurant;
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
		session.delete(namespace+"deleteReview", review);
	}

	/**
	 * 리뷰 추천
	 */
	public void recommendReview(Review review){
		session.update(namespace+"recommendReview", review);
	}
	
	/**
	 * 리뷰 조회
	 */
	@Override
	public Review selectReviewByNo(int reviewNo) {
		//session.selectOne(namespace + "updateHits", reviewNo);
		return session.selectOne(namespace + "selectReviewByNo", reviewNo);
	}
	
	/**
	 * Review 테이블의 페이징 처리 전체 리뷰 조회 처리
	 * @param pageNo 조회할 페이지 번호
	 * @return
	 */
	@Override
	public List<Review> selectAllReviewPaging(int pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		return session.selectList(namespace+"selectAllReviewPaging", map);
	}

	/**
	 * 리뷰 전체 페이지 수
	 */
	@Override
	public int selectTotalReviewCount() {
		return session.selectOne(namespace+"selectTotalReviewCount");
	}

	/**
	 * 리뷰 조회수 증가
	 * @return 
	 */
	public void updateHitsReview(int reviewNo){
		session.update(namespace + "updateHits", reviewNo);
	}
	
	
}
