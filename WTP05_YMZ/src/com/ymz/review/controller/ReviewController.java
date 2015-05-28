package com.ymz.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {

	//리뷰 등록
	
	//리뷰 등록 성공
	
	
	//리뷰 보기
	
	
	//리뷰 목록
	@RequestMapping("/reviewList.do")
	public String reviewList() {
		return "review/review_list.tiles";
	}
	
	//리뷰 수정
	
	
	//리뷰 삭제
}
