package com.ymz.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ymz.restaurant.service.RestaurantService;

@Controller
public class MainController {
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping("/index.do")
	public String main(Model model) {
		model.addAllAttributes(restaurantService.getMainRestaurants());
		
		return "main1.tiles";
	}
}
