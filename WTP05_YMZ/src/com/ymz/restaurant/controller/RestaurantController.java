package com.ymz.restaurant.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ymz.restaurant.service.RestaurantService;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService service;
	
	@RequestMapping("/showListByType.do")
	public String showListByType(
			@RequestParam(defaultValue="1") int currentPage,
			Model model) {
		Map<String, Object> map = service.getRestaurantListPaging(currentPage);
		model.addAllAttributes(map);
		
		return "restaurant/restaurant_type.restiles";
	}
}
