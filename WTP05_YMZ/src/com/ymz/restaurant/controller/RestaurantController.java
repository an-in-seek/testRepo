package com.ymz.restaurant.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ymz.restaurant.service.RestaurantService;
import com.ymz.restaurant.vo.Restaurant;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService service;
	
	@RequestMapping("/ajax/checkName.do")
	@ResponseBody
	public boolean checkName(String name) {
		Restaurant restaurant = service.getRestaurantByName(name);
		if(restaurant==null) {
			return true;
		}
		return false;
	}
	
	@RequestMapping("/ajax/getFloorsByBuildingName.do")
	@ResponseBody
	public List<String> getFloorsByBuildingName(String buildingName) {
		return service.getFloorsByBuildingName(buildingName);
	}
	
	@RequestMapping("/showListByType.do")
	public String showListByType(
			@RequestParam(defaultValue="1") int currentPage,
			Model model) {
		Map<String, Object> map = service.getRestaurantListPaging(currentPage);
		model.addAllAttributes(map);
		
		return "restaurant/restaurant_type.tiles";
	}
	
	@RequestMapping("/addNewRestaurantForm.do")
	public String addNewRestaurantForm(Model model) {
		List<String> buildingNames = service.getBuildingNames();
		model.addAttribute("buildingNames", buildingNames);
		
		return "restaurant/restaurant_write_form.tiles";
	}
	
	@RequestMapping("/addNewRestaurant.do")
	public String addNewRestaurant(String restaurantName, String category, String phoneNo1, String phoneNo2, String phoneNo3, String address, String[] theme, String building, String floor, String description,
			@RequestParam("pictureName") MultipartFile[] pictureName, String[] foodName, String[] foodPrice, String[] foodDescription, HttpServletRequest request) throws Exception {
		// Restaurant 객체에 값 세팅
		Restaurant restaurant = new Restaurant();
		restaurant.setRestaurantName(restaurantName);
		restaurant.setCategory(category);
		restaurant.setPhoneNo(phoneNo1+"-"+phoneNo2+"-"+phoneNo3);
		restaurant.setAddress(address);
		
		String themeTemp = "";
		for(int i=0; i<theme.length; i++) {
			themeTemp += theme[i]+",";
		}
		restaurant.setTheme(themeTemp);
		
		int locationNoTemp = service.getLocationNo(building, floor);
		restaurant.setLocationNo(locationNoTemp);
		
		restaurant.setDescription(description);
		
		String pictureNameTemp = "";
		String path = request.getServletContext().getRealPath("/uploadPhoto");
		for(int i=0; i<pictureName.length; i++) {
			String fileName = System.nanoTime()+"";
			File file = new File(path, fileName);
			pictureName[i].transferTo(file);
			pictureNameTemp += fileName+",";
		}
		restaurant.setPictureName(pictureNameTemp);
		// 여기까지 세팅 끝
		
		service.addRestaurant(restaurant, foodName, foodPrice, foodDescription);
		
		return "redirect:/restaurant/showListByType.do";
	}
	
	@RequestMapping("/restaurantView.do")
	public String restaurantView(int restaurantNo, Model model) {
		Restaurant restaurant = service.getRestaurantByNo(restaurantNo);
		model.addAttribute("restaurant", restaurant);
		
		String location = service.getLocationByNo(restaurant.getLocationNo());
		model.addAttribute("restaurant_location", location);
		
		String[] pictures = restaurant.getPictureName().split(",");
		for(int i=0; i<pictures.length; i++) {
			model.addAttribute("pic"+(i+1), pictures[i]);
		}
		return "restaurant/restaurant_view.tiles";
	}
}
