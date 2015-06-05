package com.ymz.restaurant.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ymz.member.vo.Member;
import com.ymz.restaurant.service.RestaurantService;
import com.ymz.restaurant.vo.Food;
import com.ymz.restaurant.vo.Restaurant;
import com.ymz.restaurantreply.service.RestaurantReplyService;
import com.ymz.restaurantreply.vo.RestaurantReply;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService service;
	//송이꺼
	@Autowired
	private RestaurantReplyService replyService;
	
	
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
	
	@RequestMapping("/ajax/getRestaurantsByBuildingName.do")
	@ResponseBody
	public List<String> getRestaurantsByBuildingName(String buildingName) {
		return service.getRestaurantsByBuildingName(buildingName);
	}
	
	@RequestMapping("/showListByType.do")
	public String showListByType(
			@RequestParam(defaultValue="전체") String category,
			@RequestParam(defaultValue="date") String align,
			@RequestParam(defaultValue="1") int currentPage,
			String searchWord, Model model, HttpSession session) {
		Map<String, Object> map = service.getListByTypePaging(category, align, currentPage, searchWord);
		model.addAllAttributes(map);
		
		Member member = (Member)session.getAttribute("login_info");
		if(member!=null) {
			if(member.getGrade().equals("master")) {
				model.addAttribute("isAdmin",true);
			}
		}
		
		return "restaurant/restaurant_type.tiles";
	}
	
	@RequestMapping("/showListByTheme.do")
	public String showListByTheme(
			@RequestParam(defaultValue="전체") String theme,
			@RequestParam(defaultValue="date") String align,
			@RequestParam(defaultValue="1") int currentPage,
			String searchWord, Model model, HttpSession session) {
		Map<String, Object> map = service.getListByThemePaging(theme, align, currentPage, searchWord);
		model.addAllAttributes(map);
		
		Member member = (Member)session.getAttribute("login_info");
		if(member!=null) {
			if(member.getGrade().equals("master")) {
				model.addAttribute("isAdmin",true);
			}
		}
		
		return "restaurant/restaurant_theme.tiles";
	}
	
	@RequestMapping("/selectLocation.do")
	public String selectLocation() {
		return "restaurant/restaurant_location.tiles";
	}
	
	@RequestMapping("/boardByLocation.do")
	public String boardByLocation(String buildingName, String floor,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(defaultValue="date") String align,
			String searchWord, Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("login_info");
		if(member!=null) {
			if(member.getGrade().equals("master")) {
				model.addAttribute("isAdmin",true);
			}
		}
		
		Map<String, Object> map = service.getRestaurantsPaging(buildingName, floor, align, currentPage, searchWord);
		model.addAllAttributes(map);
		return "restaurant/restaurant_location_board.tiles";
	}
	
	@RequestMapping("/login/admin/addNewRestaurantForm.do")
	public String addNewRestaurantForm(Model model) {
		List<String> buildingNames = service.getBuildingNames();
		model.addAttribute("buildingNames", buildingNames);
		
		return "restaurant/restaurant_write_form.tiles";
	}
	
	@RequestMapping("/login/admin/modifyRestaurantForm.do")
	public String modifyRestaurantForm(int restaurantNo, Model model) {
		Map map = service.setRestaurantModifyForm(restaurantNo);
		model.addAllAttributes(map);
		return "restaurant/restaurant_modify_form.tiles";
	}
	
	@RequestMapping("/login/admin/addNewRestaurant.do")
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
			if(pictureName[i].getSize()!=0) {
				String fileName = System.nanoTime()+"";
				File file = new File(path, fileName);
				pictureName[i].transferTo(file);
				pictureNameTemp += fileName+",";
			}
		}
		restaurant.setPictureName(pictureNameTemp);
		// 여기까지 세팅 끝
		
		service.addRestaurant(restaurant, foodName, foodPrice, foodDescription);
		
		return "redirect:/restaurant/showListByType.do";
	}
	
	@RequestMapping("/restaurantView.do")
	@Transactional
	public String restaurantView(int restaurantNo, Model model, HttpSession session, ModelMap map) {
		Member member = (Member)session.getAttribute("login_info");
		if(member!=null) {
			if(member.getGrade().equals("master")) {
				model.addAttribute("isAdmin",true);
			}
		}

		Restaurant restaurant = service.getRestaurantByNo(restaurantNo);
		model.addAttribute("restaurant", restaurant);
		
		// 건물명과 층을 문자열로 합쳐 request scope에 올린다
		String location = service.getLocationByNo(restaurant.getLocationNo());
		model.addAttribute("restaurant_location", location);
		
		// 그림들을 request scope에 올린다
		String[] pictures = restaurant.getPictureName().split(",");
		for(int i=0; i<pictures.length; i++) {
			model.addAttribute("pic"+(i+1), pictures[i]);
		}
		
		// 선택된 가게의 음식들을 request scope에 올린다
		List<Food> foods = service.getFoodsByRestaurantNo(restaurant.getRestaurantNo());
		model.addAttribute("foods", foods);
		
		// 조회수 1증가
		service.increaseHits(restaurantNo);
		//송이꺼-----------------------------------------------------------------------------
	
		List list = replyService.selectAllRestaurantReply(restaurant.getRestaurantNo());
		map.put("replyList", list);

		return "restaurant/restaurant_view.tiles";
	}
	
	@RequestMapping("/restaurantViewByRestaurantName.do")
	public String restaurantViewByRestaurantName(String restaurantName) {
		int restaurantNo = service.getRestaurantByName(restaurantName).getRestaurantNo();
		return "/restaurant/restaurantView.do?restaurantNo="+restaurantNo;
	}
	
	
	@RequestMapping("/login/registerReply.do")
	public String registerRestaurantReply(@ModelAttribute RestaurantReply restaurantReply, HttpSession session){	
		//등록
		Member member = (Member)session.getAttribute("login_info");
		restaurantReply.setMemberId(member.getId());
		 replyService.registerRestaurantReply(restaurantReply);
		return "redirect:/restaurant/restaurantView.do?restaurantNo="+restaurantReply.getRestaurantNo();
	}
	
	@RequestMapping("/login/removeReply.do")
	public String removeRestaurantReplyByReplyNo(@ModelAttribute RestaurantReply restaurantReply, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		restaurantReply.setMemberId(member.getId());;
		return "redirect:/restaurant/restaurantView.do?restaurantNo="+restaurantReply.getNumber();

	}

	@RequestMapping("/login/admin/removeRestaurant.do")
	public String removeRestaurant(int restaurantNo) {
		service.removeRestaurant(restaurantNo);
		return "redirect:/restaurant/showListByType.do";
	}
	
}

