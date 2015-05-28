package com.ymz.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Restaurant;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSessionTemplate session;
	private String namespace = "review.dao.ReviewMapper.";
	
	
	@Override
	public List<Restaurant> selectAllReviewPaging(int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("currentPage", currentPage);
		return session.selectList(namespace+"selectAllReviewPaging", map);
	}

	@Override
	public int selectTotalReviewCount() {
		return session.selectOne(namespace+"selectTotalReviewCount");
	}

	
}
