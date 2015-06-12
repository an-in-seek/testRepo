package com.ymz.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ymz.restaurant.service.RestaurantService;
import com.ymz.review.service.ReviewService;

@Controller
public class MainController {
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/index.do")
	public String main(Model model) {
		model.addAllAttributes(restaurantService.getRandomRestaurant());
		model.addAllAttributes(restaurantService.getMainRestaurants());
		model.addAllAttributes(reviewService.getMainReview());
		return "main1.tiles";
	}
}
