package com.ymz.reviewreply.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ymz.reviewreply.service.ReviewReplyService;
import com.ymz.reviewreply.vo.ReviewReply;

@Controller
@RequestMapping("/reviewReply/")
public class ReviewReplyController {

	@Autowired
	private ReviewReplyService service;
	
	//댓글 등록
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpServletRequest request){
		if(errors.hasErrors()){
			return "review/review_view.tiles";
		}
		service.registerReviewReply(reply);
		return "";
	}
	
	//댓글 수정
	@RequestMapping(value="login/modifyReviewReply.do", method=RequestMethod.POST)
	public String modifyReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpServletRequest request){
		service.modifyReviewReply(reply);
		return "review/review_view.tiles";
	}
	
	//댓글 삭제
	@RequestMapping(value="login/removeReviewReply.do")
	public String removeReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpServletRequest request){
		String memberId = request.getParameter("memberId");
		service.removeReviewReply(memberId);
		return "review/review_view.tiles";
	}
}
