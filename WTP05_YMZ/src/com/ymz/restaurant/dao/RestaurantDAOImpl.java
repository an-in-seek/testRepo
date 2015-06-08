package com.ymz.restaurant.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.category.dao.CategoryDAO;
import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {
	
	@Autowired
	private CategoryDAO categoryDAO;
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
		
		List<Restaurant> restaurants = session.selectList(namespace+"selectListByTypePaging", map);
		for(int i=0; i<restaurants.size(); i++) {
			Restaurant restaurant = restaurants.get(i);
			restaurant.setCategory(categoryDAO.selectCategoryName(restaurant.getCategory()));
			
			String[] themes = restaurant.getTheme().split(",");
			String newThemes = "";
			for(int j=0; j<themes.length; j++) {
				if(j==themes.length-1) {
					newThemes+=themes[j];
					break;
				}
				newThemes+=categoryDAO.selectCategoryName(themes[j])+",";
			}
			restaurant.setTheme(newThemes);
		}
		
		return restaurants;
	}
	
	@Override
	public List<Restaurant> selectListByThemePaging(String theme, String align, int currentPage, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("theme", theme);
		map.put("align", align);
		map.put("currentPage", currentPage);
		map.put("searchWord", searchWord);
		
		List<Restaurant> restaurants = session.selectList(namespace+"selectListByThemePaging", map);
		for(int i=0; i<restaurants.size(); i++) {
			Restaurant restaurant = restaurants.get(i);
			restaurant.setCategory(categoryDAO.selectCategoryName(restaurant.getCategory()));
			
			String[] themes = restaurant.getTheme().split(",");
			String newThemes = "";
			for(int j=0; j<themes.length; j++) {
				if(j==themes.length-1) {
					newThemes+=themes[j];
					break;
				}
				newThemes+=categoryDAO.selectCategoryName(themes[j])+",";
			}
			restaurant.setTheme(newThemes);
		}
		return restaurants;
	}
	
	@Override
	public List<Restaurant> selectRestaurantsPaging(String buildingName, String floor, String align, int currentPage, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buildingName", buildingName);
		map.put("floor", floor);
		map.put("align", align);
		map.put("currentPage", currentPage);
		map.put("searchWord", searchWord);
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		List<Restaurant> restaurants = session.selectList(namespace+"selectRestaurantsPaging", map);
		for(int i=0; i<restaurants.size(); i++) {
			Restaurant restaurant = restaurants.get(i);
			restaurant.setCategory(categoryDAO.selectCategoryName(restaurant.getCategory()));
			
			String[] themes = restaurant.getTheme().split(",");
			String newThemes = "";
			for(int j=0; j<themes.length; j++) {
				if(j==themes.length-1) {
					newThemes+=themes[j];
					break;
				}
				newThemes+=categoryDAO.selectCategoryName(themes[j])+",";
			}
			restaurant.setTheme(newThemes);
		}
		return restaurants;
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
		Restaurant restaurant = session.selectOne(namespace+"selectRestaurantByNo", restaurantNo);
		restaurant.setCategory(categoryDAO.selectCategoryName(restaurant.getCategory()));
		String[] themes = restaurant.getTheme().split(",");
		String newThemes = "";
		for(int i=0; i<themes.length; i++) {
			themes[i] = categoryDAO.selectCategoryName(themes[i]);
			
			if(i==themes.length-1) {
				newThemes+=themes[i];
				break;
			}
			newThemes+=themes[i]+",";
		}
		restaurant.setTheme(newThemes);
		return restaurant;
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
	public int selectRestaurantCount(String buildingName, String floor, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("buildingName", buildingName);
		map.put("floor", floor);
		map.put("searchWord", searchWord);
		return session.selectOne(namespace+"selectRestaurantCount", map);
	}

	@Override
	public int selectRestaurantCountByCategory(String category, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("searchWord", searchWord);
		return session.selectOne(namespace+"selectRestaurantCountByCategory", map);
	}
	
	@Override
	public int selectRestaurantCountByTheme(String theme, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("theme", theme);
		map.put("searchWord", searchWord);
		return session.selectOne(namespace+"selectRestaurantCountByTheme", map);
	}

	@Override
	public int deleteRestaurant(int restaurantNo) {
		return session.delete(namespace+"deleteRestaurant", restaurantNo);
	}

	@Override
	public String selectBuildingNameByLocationNo(int locationNo) {
		return session.selectOne(namespace+"selectBuildingNameByLocationNo", locationNo);
	}

	@Override
	public String selectFloorByLocationNo(int locationNo) {
		return session.selectOne(namespace+"selectFloorByLocationNo", locationNo);
	}

	@Override
	public int updateRestaurant(Restaurant restaurant) {
		return session.update(namespace+"updateRestaurant", restaurant);
	}

	@Override
	public int deleteFoods(int restaurantNo) {
		return session.delete(namespace+"deleteFoods", restaurantNo);
	}
}
