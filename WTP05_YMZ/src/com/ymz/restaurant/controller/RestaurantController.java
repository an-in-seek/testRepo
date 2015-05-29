package com.ymz.restaurant.controller;

import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/showListByType.do")
	public String showListByType(
			@RequestParam(defaultValue="1") int currentPage,
			Model model) {
		Map<String, Object> map = service.getRestaurantListPaging(currentPage);
		model.addAllAttributes(map);
		
		return "restaurant/restaurant_type.restiles";
	}
	
	@RequestMapping("/addNewRestaurantForm.do")
	public String addNewRestaurantForm(Model model) {
		List<String> buildingNames = service.getBuildingNames();
		model.addAttribute("buildingNames", buildingNames);
		
		return "restaurant/restaurant_write_form.restiles";
	}
	
	@RequestMapping("/addNewRestaurant.do")
	public String addNewRestaurant(String restaurantName, String category, int phoneNo1, int phoneNo2, int phoneNo3,
			String address, String description, MultipartFile[] pictureName, String[] foodName, String[] foodPrice, String[] foodDescription) {
		
		
		return "/restaurant/showListByType.do";
	}
}
