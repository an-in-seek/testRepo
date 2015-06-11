package com.ymz.review.controller;

import java.util.HashMap;
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

import com.ymz.common.validator.ReviewReplyValidator;
import com.ymz.common.validator.ReviewValidator;
import com.ymz.member.exception.ReviewRecommendException;
import com.ymz.member.vo.Member;
import com.ymz.reportedbbs.controller.ReportedBBSController;
import com.ymz.reportedbbs.vo.ReportedBBS;
import com.ymz.review.service.ReviewService;
import com.ymz.review.vo.Review;
import com.ymz.reviewreply.service.ReviewReplyService;
import com.ymz.reviewreply.vo.ReviewReply;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private ReviewReplyService replyService;
	
	@Autowired
	private ReportedBBSController reportBBSService;
	
	//리뷰 등록
	@RequestMapping(value="login/write.do", method=RequestMethod.POST)
	public String registerReview(@ModelAttribute Review review, Errors errors, HttpSession session) throws Exception{
		new ReviewValidator().validate(review, errors);
		// 제목과 내용 미입력시 등록 실패
		if(errors.hasErrors()){
			System.out.println("모두 입력하지 않아 등록 실패");
			return "review/review_write_form.tiles";
		}
		Member member = (Member)session.getAttribute("login_info");
		review.setMemberId(member.getId());
		review.setNickname(member.getName());
		service.registerReview(review);
		return "redirect:/review/reviewList.do"; 
	}

	//리뷰 목록 - 페이징 처리 + 인기글 가져오기 + 검색
		@RequestMapping("reviewList.do")
		public ModelAndView reviewList(@RequestParam (defaultValue="latest") String sortType, @RequestParam (defaultValue="1") int pageNo, 
													@RequestParam (defaultValue="") String searchType,@RequestParam (defaultValue="") String query){
			
			Map<String, Object> map = service.ReviewSortListPaging(pageNo, sortType, searchType, query);
			/////////////////////////////////
			//Map<String, Object> map = service.getReviewListPaging(pageNo);
			return new ModelAndView("review/review_list.tiles", map);
		}

		
//	//리뷰 목록 - 페이징 처리 + 인기글 가져오기
//	@RequestMapping("reviewList.do")
//	public ModelAndView reviewList(@RequestParam (defaultValue="1") int pageNo){
//		Map<String, Object> map = service.getReviewListPaging(pageNo);
//		return new ModelAndView("review/review_list.tiles", map);
//	}
	
	//게시물 번호로 정보조회
	@RequestMapping("reviewView.do")
	public ModelAndView ReviewView(@ModelAttribute Review review){ 
		Map<String, Object> map =replyService.getReplyList(review.getReviewNo()); //DB로 reviewNo을 보내서 해당 댓글들 가져오기
		Review rev = service.getReviewByNo(review.getReviewNo()); 				  // 리뷰글 가져오기
		map.put("pageNo", review.getPageNo());
		map.put("review", rev);
		return new ModelAndView("review/review_view.tiles", map);
	}
	
	
	//리뷰 수정 폼으로 가기
	@RequestMapping(value="login/modifyForm.do")
	public ModelAndView modifyFormReview(@RequestParam int reviewNo){
		Review review = service.getReviewByNo(reviewNo);
		return new ModelAndView("review/review_modify_form.tiles", "review", review);
	}
	
	//리뷰 수정(로그인시 가능)
	@RequestMapping(value="login/modifyReview.do", method=RequestMethod.POST)
	public String modifyReview(@ModelAttribute Review review, Errors errors, HttpSession session){
		new ReviewValidator().validate(review, errors);
		// 제목과 내용 미입력시 수정 실패
		if(errors.hasErrors()){
			System.out.println("모두 입력하지 않아 수정 실패");
			return "review/review_modify_form.tiles";
		}
		
		// 작성자만 글을 수정할 수 있다.
		Review r = service.getReviewByNo(review.getReviewNo());			 // 글번호로 글내용을 가져온다.
		Member member = (Member) session.getAttribute("login_info");    // 로그인한 회원의 정보를 가져온다.
		if(r.getMemberId().equals(member.getId())){
			// 수정
			String userid = member.getId();
			review.setMemberId(userid);
			service.modifyReview(review); // 리뷰 수정
			return "redirect:/review/reviewList.do";
		}
		
		return "view/loginInfoCheck.tiles";	// 수정 실패 페이지
	}
	
	
	//리뷰 삭제(로그인시 가능)
	@RequestMapping("login/removeReview.do")
	public String removeReview(@ModelAttribute Review review, HttpSession session){
		// 작성자와 관리자만 삭제할 수 있다.
		Review r = service.getReviewByNo(review.getReviewNo());			 // 글번호로 글내용을 가져온다.
		Member member = (Member) session.getAttribute("login_info");    // 로그인한 회원의 정보를 가져온다.
		if(r.getMemberId().equals(member.getId()) || member.getGrade().equals("master")){
			// 삭제
			String userid = member.getId();
			review.setMemberId(userid);
			service.removeReview(review);
			return "redirect:/review/reviewList.do";
		}
		return "view/loginInfoCheck.tiles";	// 삭제 실패 페이지
	}
	
	// 리뷰 추천(로그인시 가능)
//	1. 추천 버튼을 누르면 추천 테이블에 값을 넣는다.
//	2. 리뷰 테이블의 추천수를 +1 해준다.
//	3. DB에서 있는지 조회한다. return type = _int , 리턴값이  0이면 업뎃하지말고 1이면 업뎃하고
//	4. 다시 추천 버튼을 누르면 추천 테이블의 값을 가져와서 비교한 뒤 같으면 다시 뷰로 돌악나다.

	@RequestMapping("login/ajax/recommendReview.do")
	@ResponseBody
	public int recommendReview(@RequestParam int reviewNo, HttpSession session, ModelMap map) throws Exception{
		Member member = (Member)session.getAttribute("login_info"); // 회원 정보 갖고오기
		int result = 0;
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		rmap.put("number", reviewNo);
		rmap.put("id", member.getId());
		
		try{
			result = service.getRecommendCount(rmap);       // 추천 테이블에서 기존 값이 있는지 확인
		}catch(Exception e){								// Null값이 Return되어 Exception이 발생했을 경우
			result = 0;										// 0을 결과값으로 입력한다.
		}
		
		if(result == 0){									// 추천 테이블에 값이 없으면
			service.inputRecommend(rmap);					// 추천 테이블에 값 입력
			service.recommendReview(reviewNo); 				// 리뷰 테이블에 추천 수 증가
		}else if(result ==1){
			throw new ReviewRecommendException();
		}
		Review review = service.getReviewByNo(reviewNo);
		int recommendCount = review.getRecommend();
		return recommendCount;
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
	
	// 현재 로그인정보를 체크해서 리턴
	@RequestMapping("ajax/findLoginMember")
	@ResponseBody
	public Member findLoginMember(HttpSession session){
		Member member = (Member) session.getAttribute("login_info");
		return member;
	}
	
	// 리뷰 신고
	@RequestMapping(value="login/reportReview.do", method=RequestMethod.POST)
	public String reportReview(@ModelAttribute ReportedBBS bbs, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		System.out.println("로그인한 회원 : " + member.getId());
		System.out.println("신고리뷰 정보 : "+ bbs);
		// 등록 메소드 추가
		return "redirect:/review/reviewView.do?reviewNo="+bbs.getReviewNo()+"&pageNo="+bbs.getPageNo();
	}
	
	/////////////////////////////////////////////////////////////////쭈욘////////////////////////////////////////////////////////////////
	
	
	//댓글 등록
		@RequestMapping(value="login/register.do", method=RequestMethod.POST)
		public String registerReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpSession session) throws Exception{
			new ReviewReplyValidator().validate(reply, errors);
			// 제목과 내용 미입력시 등록 실패
			if(errors.hasErrors()){
				System.out.println("에러 있엉");
				return "redirect:/review/reviewView.do?reviewNo="+reply.getReviewNo()+"&pageNo="+reply.getPageNo();
			}
			Member member = (Member)session.getAttribute("login_info");
			reply.setMemberId(member.getId());
			replyService.registerReviewReply(reply);
			return "redirect:/review/reviewView.do?reviewNo="+reply.getReviewNo()+"&pageNo="+reply.getPageNo();
		}
		
		//댓글 삭제
		@RequestMapping(value="login/removeReviewReply.do")
		public String removeReviewReply(@ModelAttribute ReviewReply reply, HttpSession session){
			Member member = (Member)session.getAttribute("login_info");
			String userId = member.getId();
			reply.setMemberId(userId);
			replyService.removeReviewReply(reply);
			return "redirect:/review/reviewView.do?reviewNo="+reply.getReviewNo()+"&pageNo="+reply.getPageNo();
		}

		
		//댓글 수정 
		@RequestMapping(value="login/modifyReviewReply.do", method=RequestMethod.POST)
		public ModelAndView modifyReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpSession session, ModelMap map) throws Exception{
			new ReviewReplyValidator().validate(reply, errors);
			// 제목과 내용 미입력시 등록 실패
			if(errors.hasErrors()){
				System.out.println("에러 있엉");
				return new ModelAndView("redirect:/review/reviewView.do?reviewNo="+reply.getReviewNo()+"&pageNo="+reply.getPageNo());
			}
			Member member = (Member)session.getAttribute("login_info");
			String userId = member.getId();
			reply.setMemberId(userId);
			replyService.modifyReviewReply(reply);
			map.addAttribute("reply", reply);
			return new ModelAndView("redirect:/review/reviewView.do?reviewNo="+reply.getReviewNo() + "&pageNo="+reply.getPageNo(), map);
		}

}
