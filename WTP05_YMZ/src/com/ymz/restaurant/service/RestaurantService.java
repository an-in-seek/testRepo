package com.ymz.restaurant.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;

public interface RestaurantService {
	public Map<String, Object> getListByTypePaging(String category, String align, int currentPage, String searchWord);
	public Map<String, Object> getListByThemePaging(String theme, String align, int currentPage, String searchWord);
	public Restaurant getRestaurantByName(String name);
	public List<String> getBuildingNames();
	public List<String> getFloorsByBuildingName(String buildingName);
	public int getLocationNo(String buildingName, String floor);
	public void addRestaurant(Restaurant restaurant, String[] foodNames, String[] foodPrices, String[] foodDescriptions, HttpServletRequest request) throws Exception;
	public Restaurant getRestaurantByNo(int restaurantNo);
	public String getLocationByNo(int locationNo);
	public List<Food> getFoodsByRestaurantNo(int restaurantNo);
	public int increaseHits(int restaurantNo);
	public List<String> getRestaurantsByBuildingName(String buildingName);
	public Map<String, Object> getRestaurantsPaging(String buildingName, String floor, String align, int currentPage, String searchWord);
	public void removeRestaurant(int restaurantNo, HttpServletRequest request);
	public Map setRestaurantModifyForm(int restaurantNo, HttpServletRequest request) throws Exception;
	public void modifyRestaurant(Restaurant restaurant, String[] foodName, String[] foodPrice, String[] foodDescription, HttpServletRequest request) throws Exception;
	public Map addNewRestaurantForm();
	public Map getMainRestaurants();
	public Map getRandomRestaurant();
}
