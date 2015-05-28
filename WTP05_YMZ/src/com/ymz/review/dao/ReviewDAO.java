package com.ymz.review.dao;

import java.util.List;

import com.ymz.restaurant.vo.Restaurant;

public interface ReviewDAO {
	public List<Restaurant> selectAllReviewPaging(int pageNo);
	public int selectTotalReviewCount();
}
