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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ymz.common.validator.RestaurantReplyValidator;
import com.ymz.common.validator.RestaurantValidator;
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
	
	@RequestMapping("/ajax/deleteTempFile.do")
	public void deleteTempFile(String pictures, HttpServletRequest request) {
		if(pictures.equals("")) {
			return;
		}
		
		String[] arr = pictures.split(",");
		String path = request.getServletContext().getRealPath("/tempPhoto");
		for(int i=0; i<arr.length; i++) {
			new File(path, arr[i]).delete();
		}
	}
	
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
	
	@RequestMapping("/ajax/addPictureTemp.do")
	@ResponseBody
	public String addPictureTemp(MultipartFile picture, HttpServletRequest request) throws Exception {
		String path = request.getServletContext().getRealPath("/tempPhoto");
		String fileName = null;
		if(picture!=null) {
			fileName = System.currentTimeMillis()+"";
			File file = new File(path, fileName);
			picture.transferTo(file);
		}
		
		return fileName;
	}
	
	@RequestMapping("/ajax/removePictureTemp.do")
	public void removePictureTemp(String fileName, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/tempPhoto");
		String name = fileName.split("Photo/")[1];
		new File(path, name).delete();
	}
	
	@RequestMapping("/restaurantTypeSelect.do")
	public String restaurantTypeSelect() {
		return "restaurant/restaurant_type_select.tiles";
	}
	
	@RequestMapping("/restaurantThemeSelect.do")
	public String restaurantThemeSelect() {
		return "restaurant/restaurant_theme_select.tiles";
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
	public String selectLocation(String selectedBuildingName, Model model) {
		model.addAttribute("selectedBuildingName", selectedBuildingName);
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
		Map map = service.addNewRestaurantForm();
		model.addAllAttributes(map);
		
		return "restaurant/restaurant_write_form.tiles";
	}
	
	@RequestMapping("/login/admin/modifyRestaurantForm.do")
	public String modifyRestaurantForm(int restaurantNo, Model model, HttpServletRequest request) throws Exception {
		Map map = service.setRestaurantModifyForm(restaurantNo, request);
		model.addAllAttributes(map);
		return "restaurant/restaurant_modify_form.tiles";
	}
	
	@RequestMapping("/login/admin/modifyRestaurant.do")
	public String modifyRestaurant(Restaurant restaurant, String addedPicture, String building, String floor,
			String[] foodName, String[] foodPrice, String[] foodDescription, HttpServletRequest request) throws Exception {
		restaurant.setPictureName(addedPicture+",");
		restaurant.setTheme(restaurant.getTheme()+",");
		
		int locationNo = service.getLocationNo(building, floor);
		restaurant.setLocationNo(locationNo);
		
		service.modifyRestaurant(restaurant, foodName, foodPrice, foodDescription, request);
		
		return "redirect:/restaurant/restaurantView.do?restaurantNo="+restaurant.getRestaurantNo();
	}
	
	@RequestMapping("/login/admin/addNewRestaurant.do")
	public String addNewRestaurant(Restaurant restaurant, String addedPicture, String building, String floor, 
			String[] foodName, String[] foodPrice, String[] foodDescription, HttpServletRequest request, Errors errors) throws Exception {
		new RestaurantValidator().validate(restaurant, errors);
		if(errors.hasErrors()) {
			return "/restaurant/login/admin/addNewRestaurantForm.do";
		}
		
		restaurant.setPictureName(addedPicture);
		
		int locationNo = service.getLocationNo(building, floor);
		restaurant.setLocationNo(locationNo);
		
		service.addRestaurant(restaurant, foodName, foodPrice, foodDescription, request);
		
		return "redirect:/restaurant/showListByType.do";
	}
	
	@RequestMapping("/restaurantView.do")
	@Transactional
	public String restaurantView(int restaurantNo, String backURL, Model model, HttpSession session, ModelMap map) {
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
		model.addAttribute("pictures", restaurant.getPictureName().split(","));
		
		// 선택된 가게의 음식들을 request scope에 올린다
		List<Food> foods = service.getFoodsByRestaurantNo(restaurant.getRestaurantNo());
		model.addAttribute("foods", foods);
		
		// 목록으로 돌아갈 url을 session scope에 올린다
		if(backURL!=null) {
			session.setAttribute("backURL", backURL);
		}
		
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
	public String registerRestaurantReply(@ModelAttribute RestaurantReply restaurantReply, Errors errors, HttpSession session){	
		//만약에 jsp브라우저단에서 유효성 검사를 못해줄 경우(내용이 없을 때,평점을 안줬을 때)
		//처리가 안된 댓글 정보를 컨트롤러(서버)에서 유효성 검사를 해준다. 
		//클래스단에서 에러잡기
		new RestaurantReplyValidator().validate(restaurantReply, errors);
		if(errors.hasErrors()){
			System.out.println("댓글 정보를 입력하지 않아 등록 실패");
			return "/restaurant/restaurantView.do";
		}
		//등록
		Member member = (Member)session.getAttribute("login_info");
		restaurantReply.setMemberId(member.getId());
		restaurantReply.setNickname(member.getNickname());
		 replyService.registerRestaurantReply(restaurantReply);
		return "redirect:/restaurant/restaurantView.do?restaurantNo="+restaurantReply.getRestaurantNo();
	}
	//댓글 삭제
	@RequestMapping("/login/removeReply.do")
	public String removeRestaurantReply(@ModelAttribute RestaurantReply restaurantReply,@RequestParam int number, @RequestParam int restaurantNo ,HttpSession session) throws Exception {
		Member member = (Member)session.getAttribute("login_info");
		String userId = member.getId();
		System.out.println(number);
		replyService.removeRestaurantReply(restaurantReply,number, userId);
		return "redirect:/restaurant/restaurantView.do?restaurantNo="+restaurantNo;

	}
	//수정하기
	@RequestMapping("/login/updateReply.do")
	public String modifyRestaurantReply(@ModelAttribute RestaurantReply restaurantReply,Errors errors,HttpSession session){
		//클래스단에서 에러잡기
		new RestaurantReplyValidator().validate(restaurantReply, errors);
		if(errors.hasErrors()){
			System.out.println("댓글 수정 정보를 입력하지 않아 등록 실패");
			return "/restaurant/restaurantView.do";
		}
		
		Member member = (Member)session.getAttribute("login_info");
		String userId = member.getId();
		restaurantReply.setMemberId(userId);
		System.out.println("수정할 댓글 : "+restaurantReply.getContent());
		System.out.println("로그인한 아이디 : "+userId);
		System.out.println("맛집정보 번호 : "+restaurantReply.getRestaurantNo());
		System.out.println("댓글번호 : "+restaurantReply.getNumber());
//		System.out.println("페이지번호 : "+restaurantReply.get);
		replyService.modifyRestaurantReply(restaurantReply);
		int restaurantNo = restaurantReply.getRestaurantNo();
		return "redirect:/restaurant/restaurantView.do?restaurantNo="+restaurantNo;
		
	}
	
	//레스토랑삭제하기
	@RequestMapping("/login/admin/removeRestaurant.do")
	public String removeRestaurant(int restaurantNo, HttpServletRequest request) {
		service.removeRestaurant(restaurantNo, request);
		return "redirect:/restaurant/showListByType.do";
	}
	
}

