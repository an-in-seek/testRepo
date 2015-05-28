package com.ymz.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Restaurant;
import com.ymz.review.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	@Override
	public Map<String, Object> getReviewListPaging(int currentPage) {
		List<Restaurant> list = dao.selectAllReviewPaging(currentPage);
		int totalContent = dao.selectTotalReviewCount();
		PagingBean pagingBean = new PagingBean(totalContent, currentPage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewList", list);
		map.put("pagingBean", pagingBean);
		return map;
	}

}
