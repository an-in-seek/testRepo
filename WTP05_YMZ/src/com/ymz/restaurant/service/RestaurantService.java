package com.ymz.restaurant.service;

import java.util.List;
import java.util.Map;

import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;

public interface RestaurantService {
	public Map<String, Object> getRestaurantListPaging(int currentPage);
	public Restaurant getRestaurantByName(String name);
	public List<String> getBuildingNames();
	public List<String> getFloorsByBuildingName(String buildingName);
	public int getLocationNo(String buildingName, String floor);
	public void addRestaurant(Restaurant restaurant, String[] foodNames, String[] foodPrices, String[] foodDescriptions);
	public Restaurant getRestaurantByNo(int restaurantNo);
	public String getLocationByNo(int locationNo);
	public List<Food> getFoodsByRestaurantNo(int restaurantNo);
}
