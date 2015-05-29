package com.ymz.restaurant.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Restaurant;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	private String namespace = "restaurant.dao.RestaurantMapper.";
	
	@Override
	public List<Restaurant> selectAllRestaurantPaging(int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("currentPage", currentPage);
		return session.selectList(namespace+"selectAllRestaurantPaging", map);
	}

	@Override
	public int selectTotalRestaurantCount() {
		return session.selectOne(namespace+"selectTotalRestaurantCount");
	}

	@Override
	public Restaurant selectRestaurantByName(String name) {
		return session.selectOne(namespace+"selectRestaurantByName", name);
	}

	@Override
	public List<String> selectBuildingNames() {
		return session.selectList(namespace+"selectBuildingNames");
	}

}
