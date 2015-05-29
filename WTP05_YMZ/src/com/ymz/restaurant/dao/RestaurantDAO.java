package com.ymz.restaurant.dao;

import java.util.List;

import com.ymz.restaurant.vo.Restaurant;

public interface RestaurantDAO {
	public List<Restaurant> selectAllRestaurantPaging(int pageNo);
	public int selectTotalRestaurantCount();
	public Restaurant selectRestaurantByName(String name);
	public List<String> selectBuildingNames();
}
