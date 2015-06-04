package com.ymz.restaurant.dao;

import java.util.List;

import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;

public interface RestaurantDAO {
	public List<Restaurant> selectListByTypePaging(String category, String align, int pageNo, String searchWord);
	public List<Restaurant> selectListByThemePaging(String theme, String align, int pageNo, String searchWord);
	public int selectTotalRestaurantCount();
	public int selectRestaurantCountByCategory(String category, String searchWord);
	public int selectRestaurantCountByTheme(String theme, String searchWord);
	public Restaurant selectRestaurantByName(String name);
	public List<String> selectBuildingNames();
	public List<String> selectFloorsByBuildingName(String buildingName);
	public int selectLocationNo(String buildingName, String floor);
	public int insertRestaurant(Restaurant restaurant);
	public int insertFood(int restaurantNo, String foodName, int foodPrice, String foodDescription);
	public Restaurant selectRestaurantByNo(int restaurantNo);
	public String selectLocationByNo(int locationNo);
	public List<Food> selectFoodsByRestaurantNo(int restaurantNo);
	public int updateHits(int restaurantNo);
	public List<Restaurant> selectRestaurantsByBuildingNameAndFloor(String buildingName, String floor);
	public List<Restaurant> selectRestaurantsPaging(String buildingName, String floor, String align, int currentPage, String searchWord);
	public int selectRestaurantCount(String buildingName, String floor, String searchWord);
}
