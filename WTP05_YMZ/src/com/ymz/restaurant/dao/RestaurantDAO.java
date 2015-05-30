package com.ymz.restaurant.dao;

import java.util.List;

import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;

public interface RestaurantDAO {
	public List<Restaurant> selectAllRestaurantPaging(int pageNo);
	public int selectTotalRestaurantCount();
	public Restaurant selectRestaurantByName(String name);
	public List<String> selectBuildingNames();
	public List<String> selectFloorsByBuildingName(String buildingName);
	public int selectLocationNo(String buildingName, String floor);
	public int insertRestaurant(Restaurant restaurant);
	public int insertFood(int restaurantNo, String foodName, int foodPrice, String foodDescription);
	public Restaurant selectRestaurantByNo(int restaurantNo);
	public String selectLocationByNo(int locationNo);
	public List<Food> selectFoodsByRestaurantNo(int restaurantNo);
}
