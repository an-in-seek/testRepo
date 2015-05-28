package com.ymz.review.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ymz.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	//리뷰 등록
	
	
	//리뷰 등록 성공
	
	
	//리뷰 보기
	
	
	//리뷰 목록
	@RequestMapping("/reviewList.do")
	public String reviewList(@RequestParam (defaultValue="1") int currentPage,
			Model model) {
		
		Map<String, Object> map = service.getReviewListPaging(currentPage);
		model.addAllAttributes(map);
		return "review/review_list.tiles";
	}
	
	//리뷰 수정
	
	
	//리뷰 삭제
}
