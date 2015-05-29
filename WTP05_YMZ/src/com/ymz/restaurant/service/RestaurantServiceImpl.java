package com.ymz.restaurant.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<String> getFloorsByBuildingName(String buildingName) {
		return dao.selectFloorsByBuildingName(buildingName);
	}

	@Override
	public int getLocationNo(String buildingName, String floor) {
		return dao.selectLocationNo(buildingName, floor);
	}

	@Override
	@Transactional
	public void addRestaurant(Restaurant restaurant, String[] foodNames,
			String[] foodPrices, String[] foodDescriptions) {
		dao.insertRestaurant(restaurant);
		
		if(foodNames.length==0||foodPrices.length==0){}
		else {
			ArrayList<String> foodNamesList = new ArrayList<String>();
			ArrayList<Integer> foodPricesList = new ArrayList<Integer>();
			ArrayList<String> foodDescriptionsList = new ArrayList<String>();
			for(int i=0; i<foodNames.length; i++) {
				foodNamesList.add(foodNames[i]);
				foodPricesList.add(Integer.parseInt(foodPrices[i]));
				foodDescriptionsList.add(foodDescriptions[i]);
			}
			for(int i=0; i<foodNamesList.size(); i++) {
				if(foodNamesList.get(i).trim().equals("")) {
					foodNamesList.remove(i);
					foodPricesList.remove(i);
					foodDescriptionsList.remove(i);
				}
			}
			
			for(int i=0; i<foodNamesList.size(); i++) {
				dao.insertFood(restaurant.getRestaurantNo(), foodNamesList.get(i), foodPricesList.get(i), foodDescriptionsList.get(i));
			}
		}
	}
}
