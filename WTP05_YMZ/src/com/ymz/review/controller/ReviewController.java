package com.ymz.review.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView reviewList(@RequestParam (defaultValue="1") int pageNo){
		Map<String, Object> map = service.getReviewListPaging(pageNo);
		return new ModelAndView("review/review_list.tiles", map);
	}
	
	//게시물 번호로 정보조회
	@RequestMapping("reviewView.do")
	public ModelAndView ReviewView(@RequestParam int reviewNo){
		Review review = service.getReviewByNo(reviewNo);
		return new ModelAndView("review/review_view.tiles", "review", review);
	}
	
	
	//리뷰 수정 폼으로 가기
	@RequestMapping(value="login/modifyForm.do")
	public ModelAndView modifyFormReview(@RequestParam int reviewNo){
		Review review = service.getReviewByNo(reviewNo);
		return new ModelAndView("review/review_modify_form.tiles", "review", review);
	}
	
	//리뷰 수정(로그인시 가능)
	@RequestMapping(value="login/modifyReview.do")
	public String modifyReview(@ModelAttribute Review review, @RequestParam int reviewNo, Errors errors, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		String userid = member.getId();
		System.out.println("수정할 글번호 : "+ reviewNo);
		System.out.println("글쓴이 아이디: " + userid);
		review.setMemberId(userid);
		review.setReviewNo(reviewNo);
		service.modifyReview(review);
		System.out.println("글번호 "+reviewNo+" 수정 완료!!");
		return "redirect:/review/reviewList.do";
	}
	
	
	//리뷰 삭제(로그인시 가능)
	@RequestMapping("login/removeReview.do")
	public String removeReview(@ModelAttribute Review review, @RequestParam int reviewNo, ModelMap map, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		String userid = member.getId();
		System.out.println("삭제할 글번호 : "+ reviewNo);
		System.out.println("글쓴이 아이디: " + userid);
		review.setMemberId(userid);
		review.setReviewNo(reviewNo);
		service.removeReview(review);
		System.out.println("글번호 "+reviewNo+" 삭제 완료!!");
		return "redirect:/review/reviewList.do";
	}
	
	// 리뷰 추천(로그인시 가능)
	@RequestMapping("login/recommendReview.do")
	public String recommendReview(@ModelAttribute Review review, @RequestParam int reviewNo){
		System.out.println("추천할 글번호 : " + reviewNo);
		review.setReviewNo(reviewNo);
		service.recommendReview(review);
		return "/review/reviewView.do";
	}
	
	// 리뷰 검색
	
	public String searchReview(    ){
		
		return "/review/reviewList.do";
	}
	
	// 조회수 증가
	@RequestMapping("ajax/updateHits.do")
	@ResponseBody
	public int searchReview(@RequestParam int reviewNo, ModelMap map){
		service.updateHitsReview(reviewNo);
		Review review = service.getReviewByNo(reviewNo);
		int hits = review.getHits();
		return hits;
	}
}
