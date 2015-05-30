package com.ymz.review.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ymz.faq.vo.FAQ;
import com.ymz.member.vo.Member;
import com.ymz.review.service.ReviewService;
import com.ymz.review.vo.Review;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	//리뷰 등록
	@RequestMapping(value="login/write.do", method=RequestMethod.POST)
	public String registerReview(@ModelAttribute Review review, Errors errors, HttpSession session, ModelMap map) throws Exception{
		if(errors.hasErrors()){
			return "review/review_write_form.tiles";
		}
		Member member = (Member)session.getAttribute("login_info");
		review.setMemberId(member.getId());
		service.registerReview(review);
		return "redirect:/review/reviewList.do"; 
	}

	
	//리뷰 목록 - 페이징 처리
	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(@RequestParam (defaultValue="1") int currentPage){
		Map<String, Object> map = service.getReviewListPaging(currentPage);
		return new ModelAndView("review/review_list.tiles", map);
	}
	
	//리뷰 수정(로그인시 가능)
	@RequestMapping(value="login/modifyReview.do", method=RequestMethod.POST)
	public String modifyReview(@ModelAttribute Review review, Errors errors,  HttpServletRequest request){
		service.modifyReview(review);
		return "review/review_list.tiles";
	}
	
	
	//리뷰 삭제(로그인시 가능)
	@RequestMapping("login/removeReview.do")
	public String removeReview(@ModelAttribute Review review, HttpServletRequest request, ModelMap map){
		int number = Integer.parseInt(request.getParameter("review_number"));
		service.removeReview(number);
		return "review/review_list.tiles";
	}
}
