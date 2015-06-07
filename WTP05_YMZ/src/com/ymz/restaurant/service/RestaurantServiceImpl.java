package com.ymz.restaurant.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.common.util.PagingBean;
import com.ymz.restaurant.dao.RestaurantDAO;
import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	private RestaurantDAO dao;
	
	@Override
	public Map<String, Object> getListByTypePaging(String category, String align, int currentPage, String searchWord) {
		List<Restaurant> list = dao.selectListByTypePaging(category, align, currentPage, searchWord);
		
		int totalContent = dao.selectRestaurantCountByCategory(category, searchWord);
		PagingBean pagingBean = new PagingBean(totalContent, currentPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantList", list);
		map.put("pagingBean", pagingBean);
		map.put("category", category);
		map.put("align", align);
		map.put("searchWord", searchWord);
		map.put("today", new SimpleDateFormat("yyyyMMdd").format(new Date()));
		return map;
	}
	
	@Override
	public Map<String, Object> getListByThemePaging(String theme, String align, int currentPage, String searchWord) {
		List<Restaurant> list = dao.selectListByThemePaging(theme, align, currentPage, searchWord);
		
		int totalContent = dao.selectRestaurantCountByTheme(theme, searchWord);
		PagingBean pagingBean = new PagingBean(totalContent, currentPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantList", list);
		map.put("pagingBean", pagingBean);
		map.put("theme", theme);
		map.put("align", align);
		map.put("searchWord", searchWord);
		map.put("today", new SimpleDateFormat("yyyyMMdd").format(new Date()));
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
			String[] foodPrices, String[] foodDescriptions, HttpServletRequest request) throws Exception {
		dao.insertRestaurant(restaurant);
		
		ArrayList<String> foodNamesList = new ArrayList<String>();
		ArrayList<Integer> foodPricesList = new ArrayList<Integer>();
		ArrayList<String> foodDescriptionsList = new ArrayList<String>();
		for(int i=0; i<foodNames.length; i++) {
			if(!foodNames[i].equals("")) {
				foodNamesList.add(foodNames[i]);
				foodPricesList.add(Integer.parseInt(foodPrices[i]));
				foodDescriptionsList.add(foodDescriptions[i]);
			}
		}
		
		for(int i=0; i<foodNamesList.size(); i++) {
			dao.insertFood(restaurant.getRestaurantNo(), foodNamesList.get(i), foodPricesList.get(i), foodDescriptionsList.get(i));
		}
		
		String path = request.getServletContext().getRealPath("/uploadPhoto");
		String tempPath = request.getServletContext().getRealPath("/tempPhoto");
		String[] fileNames = restaurant.getPictureName().split(",");
		for(int i=0; i<fileNames.length; i++) {
			File tempFile = new File(tempPath, fileNames[i]);
			File file = new File(path, fileNames[i]);
			fileCopy(tempFile, file);
			tempFile.delete();
		}
	}

	@Override
	public Restaurant getRestaurantByNo(int restaurantNo) {
		return dao.selectRestaurantByNo(restaurantNo);
	}

	@Override
	public String getLocationByNo(int locationNo) {
		return dao.selectLocationByNo(locationNo);
	}

	@Override
	public List<Food> getFoodsByRestaurantNo(int restaurantNo) {
		return dao.selectFoodsByRestaurantNo(restaurantNo);
	}

	@Override
	public int increaseHits(int restaurantNo) {
		return dao.updateHits(restaurantNo);
	}

	@Override
	public List<String> getRestaurantsByBuildingName(String buildingName) {
		if(buildingName==null) {
			return null;
		}
		
		List<String> floors = dao.selectFloorsByBuildingName(buildingName);
		List<String> data = new ArrayList<String>();
		for(int i=0; i<floors.size(); i++) {
			List<Restaurant> restaurants = dao.selectRestaurantsByBuildingNameAndFloor(buildingName, floors.get(i));
			String temp = "";
			for(int j=0; j<restaurants.size(); j++) {
				temp += restaurants.get(j).getRestaurantName()+",";
			}
			data.add(floors.get(i)+"층");
			data.add(temp);
		}
		return data;
	}

	@Override
	public Map<String, Object> getRestaurantsPaging(String buildingName, String floor, String align, int currentPage, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Restaurant> restaurants = dao.selectRestaurantsPaging(buildingName, floor.split("층")[0], align, currentPage, searchWord);
		map.put("restaurants", restaurants);
		
		int totalContent = dao.selectRestaurantCount(buildingName, floor.split("층")[0], searchWord);
		PagingBean pagingBean = new PagingBean(totalContent, currentPage);
		map.put("pagingBean", pagingBean);
		
		List<String> buildingNames = dao.selectBuildingNames();
		map.put("buildingNames", buildingNames);
		map.put("currentBuildingName", buildingName);
		map.put("currentFloor", floor.split("층")[0]);
		map.put("currentAlign", align);
		map.put("searchWord", searchWord);
		
		List<String> floors = dao.selectFloorsByBuildingName(buildingName);
		map.put("floors", floors);
		
		return map;
	}

	@Override
	public void removeRestaurant(int restaurantNo, HttpServletRequest request) {
		Restaurant restaurant = dao.selectRestaurantByNo(restaurantNo);
		String[] pictureNames = restaurant.getPictureName().split(",");
		String path = request.getServletContext().getRealPath("/uploadPhoto");
		for(int i=0; i<pictureNames.length; i++) {
			new File(path, pictureNames[i]).delete();
		}
		
		dao.deleteRestaurant(restaurantNo);
	}

	@Override
	public Map setRestaurantModifyForm(int restaurantNo, HttpServletRequest request) throws IOException {
		Map map = new HashMap();
		
		Restaurant restaurant = dao.selectRestaurantByNo(restaurantNo);
		map.put("restaurant", restaurant);
		map.put("buildingNames", dao.selectBuildingNames());
		String currentBuildingName = dao.selectBuildingNameByLocationNo(restaurant.getLocationNo());
		map.put("currentBuildingName", currentBuildingName);
		map.put("floors", dao.selectFloorsByBuildingName(currentBuildingName));
		map.put("currentFloor", dao.selectFloorByLocationNo(restaurant.getLocationNo()));
		map.put("menus", dao.selectFoodsByRestaurantNo(restaurantNo));
		
		String path = request.getServletContext().getRealPath("/uploadPhoto");
		String tempPath = request.getServletContext().getRealPath("/tempPhoto");
		String[] pictureNames = restaurant.getPictureName().split(",");
		for(int i=0; i<pictureNames.length; i++) {
			File file = new File(path, pictureNames[i]);
			File newFile = new File(tempPath, pictureNames[i]);
			fileCopy(file, newFile);
		} // 수정화면 띄우면서 원본파일->임시폴더로 저장
		
		return map;
	}
	
	@Override
	@Transactional
	public void modifyRestaurant(Restaurant restaurant, String[] foodName, String[] foodPrice, String[] foodDescription, HttpServletRequest request) throws Exception {
		dao.updateRestaurant(restaurant);
		dao.deleteFoods(restaurant.getRestaurantNo());
		
		ArrayList<String> foodNamesList = new ArrayList<String>();
		ArrayList<Integer> foodPricesList = new ArrayList<Integer>();
		ArrayList<String> foodDescriptionsList = new ArrayList<String>();
		for(int i=0; i<foodName.length; i++) {
			if(!foodName[i].equals("")) {
				foodNamesList.add(foodName[i]);
				foodPricesList.add(Integer.parseInt(foodPrice[i]));
				foodDescriptionsList.add(foodDescription[i]);
			}
		}
		
		for(int i=0; i<foodNamesList.size(); i++) {
			dao.insertFood(restaurant.getRestaurantNo(), foodNamesList.get(i), foodPricesList.get(i), foodDescriptionsList.get(i));
		}
		
		String path = request.getServletContext().getRealPath("/uploadPhoto");
		String tempPath = request.getServletContext().getRealPath("/tempPhoto");
		String[] fileNames = restaurant.getPictureName().split(",");
		for(int i=0; i<fileNames.length; i++) {
			File tempFile = new File(tempPath, fileNames[i]);
			File file = new File(path, fileNames[i]);
			fileCopy(tempFile, file);
			tempFile.delete();
		}
	}
	
	public void fileCopy(File srcFile, File targetFile) throws IOException {
		// byte[]을 이용한 입출력
		FileInputStream fis = null;
		FileOutputStream fos = null;
		byte[] buffer = new byte[100000];
		try {
			// 1. 연결
			fis = new FileInputStream(srcFile);
			fos = new FileOutputStream(targetFile);
			
			// 2. 입출력작업
			int i = fis.read(buffer); // buffer에 읽은 byte를 넣어 준다. 읽은 byte수를 return. EOF 읽은 경우 -1
			while(i!=-1) {
				fos.write(buffer, 0, i); // buffer(배열) 내에 있는 byte들을 한번에 출력, 0번 index에서 i개만큼
				i = fis.read(buffer);
			}
			// io종료
		} finally {
			// 3. 연결 닫기
			if(fis!=null) fis.close();
			if(fos!=null) fos.close();
		}
	}
}
