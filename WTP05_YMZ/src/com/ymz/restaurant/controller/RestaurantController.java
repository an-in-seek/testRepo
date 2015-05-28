package com.ymz.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@RequestMapping("/listByType.do")
	public String listByType() {
		return "restaurant/restaurant_type.restiles";
	}
}
