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
	public List<Restaurant> selectListByTypePaging(String category, String align, int currentPage, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("category", category);
		map.put("align", align);
		map.put("currentPage", currentPage);
		map.put("searchWord", searchWord);
		return session.selectList(namespace+"selectListByTypePaging", map);
	}
	
	@Override
	public List<Restaurant> selectListByThemePaging(String theme, String align, int currentPage, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("theme", theme);
		map.put("align", align);
		map.put("currentPage", currentPage);
		map.put("searchWord", searchWord);
		return session.selectList(namespace+"selectListByThemePaging", map);
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

	@Override
	public String selectLocationByNo(int locationNo) {
		return session.selectOne(namespace+"selectLocationByNo", locationNo);
	}

	@Override
	public List<Food> selectFoodsByRestaurantNo(int restaurantNo) {
		return session.selectList(namespace+"selectFoodsByRestaurantNo", restaurantNo);
	}

	@Override
	public int updateHits(int restaurantNo) {
		return session.update(namespace+"updateHits", restaurantNo);
	}

	@Override
	public List<Restaurant> selectRestaurantsByBuildingNameAndFloor(String buildingName, String floor) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("buildingName", buildingName);
		map.put("floor", floor);
		return session.selectList(namespace+"selectRestaurantsByBuildingNameAndFloor", map);
	}

	@Override
	public List<Restaurant> selectRestaurantsPaging(String buildingName, String floor, int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buildingName", buildingName);
		map.put("floor", floor);
		map.put("currentPage", currentPage);
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		return session.selectList(namespace+"selectRestaurantsPaging", map);
	}

	@Override
	public int selectRestaurantCount(String buildingName, String floor) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("buildingName", buildingName);
		map.put("floor", floor);
		return session.selectOne(namespace+"selectRestaurantCount", map);
	}
}
