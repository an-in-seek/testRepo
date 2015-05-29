package com.ymz.restaurant.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.dao.RestaurantDAO;
import com.ymz.restaurant.vo.Restaurant;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	private RestaurantDAO dao;
	
	@Override
	public Map<String, Object> getRestaurantListPaging(int currentPage) {
		List<Restaurant> list = dao.selectAllRestaurantPaging(currentPage);
		int totalContent = dao.selectTotalRestaurantCount();
		PagingBean pagingBean = new PagingBean(totalContent, currentPage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantList", list);
		map.put("pagingBean", pagingBean);
		return map;
	}

	@Override
	public Restaurant getRestaurantByName(String name) {
		return dao.selectRestaurantByName(name);
	}

	@Override
	public List<String> getBuildingNames() {
		return dao.selectBuildingNames();
	}
}
