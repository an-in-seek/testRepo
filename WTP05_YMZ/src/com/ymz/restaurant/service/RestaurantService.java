package com.ymz.restaurant.service;

import java.util.List;
import java.util.Map;

import com.ymz.restaurant.vo.Restaurant;

public interface RestaurantService {
	public Map<String, Object> getRestaurantListPaging(int currentPage);
	public Restaurant getRestaurantByName(String name);
	public List<String> getBuildingNames();
}
