package com.ymz.restaurant.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Food;
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

	@Override
	public List<String> selectFloorsByBuildingName(String buildingName) {
		return session.selectList(namespace+"selectFloorsByBuildingName", buildingName);
	}

	@Override
	public int selectLocationNo(String buildingName, String floor) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("buildingName", buildingName);
		map.put("floor", floor);
		return session.selectOne(namespace+"selectLocationNo", map);
	}

	@Override
	public int insertRestaurant(Restaurant restaurant) {
		return session.insert(namespace+"insertRestaurant", restaurant);
	}

	@Override
	public int insertFood(int restaurantNo, String foodName, int foodPrice, String foodDescription) {
		Food food = new Food();
		food.setRestaurantNo(restaurantNo);
		food.setFoodName(foodName);
		food.setFoodPrice(foodPrice);
		food.setFoodDescription(foodDescription);
		return session.insert(namespace+"insertFood", food);
	}

	@Override
	public Restaurant selectRestaurantByNo(int restaurantNo) {
		return session.selectOne(namespace+"selectRestaurantByNo", restaurantNo);
	}
}
