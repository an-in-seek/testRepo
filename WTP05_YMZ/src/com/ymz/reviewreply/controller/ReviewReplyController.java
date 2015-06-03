package com.ymz.reviewreply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ymz.member.vo.Member;
import com.ymz.reviewreply.service.ReviewReplyService;
import com.ymz.reviewreply.vo.ReviewReply;

@Controller
@RequestMapping("/reviewReply/")
public class ReviewReplyController {

	@Autowired
	private ReviewReplyService service;
	
	//댓글 등록
	@RequestMapping(value="login/register.do", method=RequestMethod.POST)
	public String registerReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpSession session) throws Exception{
		if(errors.hasErrors()){
			return "review/review_view.tiles";
		}
		Member member = (Member)session.getAttribute("login_info");
		reply.setMemberId(member.getId());
		service.registerReviewReply(reply);
		return "redirect:/review/review_view.tiles";
	}
	
	//댓글 수정
	@RequestMapping(value="login/modifyReviewReply.do", method=RequestMethod.POST)
	public String modifyReviewReply(@ModelAttribute ReviewReply reply, @RequestParam int replyNo, Errors errors, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		String userId = member.getId();
		System.out.println("수정할 글번호 : " + replyNo);
		System.out.println("글쓴이 아이디 : " + userId);
		reply.setMemberId(userId);
		reply.setReplyNo(replyNo);
		service.modifyReviewReply(reply);
		System.out.println("글번호 : " + replyNo + "수정완료 ! ");
		return "redirect:/review/review_view.tiles";
	}
	
	//댓글 삭제
	@RequestMapping(value="login/removeReviewReply.do")
	public String removeReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpServletRequest request){
		String memberId = request.getParameter("memberId");
		service.removeReviewReply(reply);
		return "review/review_view.tiles";
	}
}
