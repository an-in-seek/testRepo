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

import com.ymz.member.vo.Member;
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
	
	//리뷰 등록
	@RequestMapping(value="login/write.do", method=RequestMethod.POST)
	public String registerReview(@ModelAttribute Review review, Errors errors, HttpSession session) throws Exception{
		if(errors.hasErrors()){
			return "review/review_write_form.tiles";
		}
		Member member = (Member)session.getAttribute("login_info");
		review.setMemberId(member.getId());
		service.registerReview(review);
		return "redirect:/review/reviewList.do"; 
	}

	//리뷰 목록 - 페이징 처리 + 인기글 가져오기
		@RequestMapping("reviewList.do")
		public ModelAndView reviewList(@RequestParam (defaultValue="latest") String sortType, @RequestParam (defaultValue="1") int pageNo, 
															@RequestParam (defaultValue="") String searchType, String query){
			System.out.println("정렬 타입 : " + sortType);
			System.out.println("검색 타입 : " + searchType);
			System.out.println("검색어 : " + query);
			
			Map<String, Object> map = service.ReviewSortListPaging(pageNo, sortType, searchType, query);
			/////////////////////////////////
			//Map<String, Object> map = service.getReviewListPaging(pageNo);
			return new ModelAndView("review/review_list.tiles", map);
		}
	
	//////////////////////////////////////////////////////////////////////////////////////////// 리뷰 검색
		@RequestMapping("searchReview.do")
		public String searchReview(@RequestParam (defaultValue="1") int pageNo, @RequestParam String searchType, @RequestParam String query){
			System.out.println("검색 타입 : " + searchType);
			System.out.println("검색어 : " + query);
			
			return "/review/reviewList.do";
		}
		
//	//리뷰 목록 - 페이징 처리 + 인기글 가져오기
//	@RequestMapping("reviewList.do")
//	public ModelAndView reviewList(@RequestParam (defaultValue="1") int pageNo){
//		Map<String, Object> map = service.getReviewListPaging(pageNo);
//		return new ModelAndView("review/review_list.tiles", map);
//	}
	
	//게시물 번호로 정보조회
	@RequestMapping("reviewView.do")
	public ModelAndView ReviewView(@ModelAttribute Review review){ //@RequestParam int reviewNo, @RequestParam int pageNo
		Map<String, Object> map =replyService.getReplyList(review.getReviewNo()); //DB로 reviewNo을 보내서 해당댓글들 가꼬오기
		
		Review rev = service.getReviewByNo(review.getReviewNo());
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
	@RequestMapping(value="login/modifyReview.do")
	public String modifyReview(@ModelAttribute Review review, Errors errors, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		String userid = member.getId();
		review.setMemberId(userid);
		service.modifyReview(review); // 리뷰 수정
		return "redirect:/review/reviewList.do";
	}
	
	
	//리뷰 삭제(로그인시 가능)
	@RequestMapping("login/removeReview.do")
	public String removeReview(@ModelAttribute Review review, Errors errors, HttpSession session){
		Member member = (Member)session.getAttribute("login_info");
		String userid = member.getId();
		review.setMemberId(userid);
		service.removeReview(review);
		return "redirect:/review/reviewList.do";
	}
	
	// 리뷰 추천(로그인시 가능)
//	1. 추천 버튼을 누르면 추천 테이블에 값을 넣는다.
//	2. 리뷰 테이블의 추천수를 +1 해준다.
//	3. DB에서 있는지 조회한다. return type = _int , 리턴값이  0이면 업뎃하지말고 1이면 업뎃하고
//	4. 다시 추천 버튼을 누르면 추천 테이블의 값을 가져와서 비교한 뒤 같으면 다시 뷰로 돌악나다.

	@RequestMapping("login/ajax/recommendReview.do")
	@ResponseBody
	public int recommendReview(@RequestParam int reviewNo, HttpSession session, ModelMap map){
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
	

	/////////////////////////////////////////////////////////////////쭈욘////////////////////////////////////////////////////////////////
	
	
	//댓글 등록
		@RequestMapping(value="login/register.do", method=RequestMethod.POST)
		public String registerReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpSession session) throws Exception{
			if(errors.hasErrors()){
				System.out.println("에러 있엉");
				return "review/review_view.tiles";
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

		/////////////////////////////////////////////////////////////////////////////////////////댓글 수정(글옮기기) 필요없음
		@RequestMapping(value="login/modifyReviewReplyform.do")
		public ModelAndView modifyReviewReplyform(@ModelAttribute ReviewReply reply, ModelMap map){
			reply = replyService.getReviewReplyContent(reply.getReplyNo());
			System.out.println(reply.getContent());
			map.addAttribute("reply", reply);
			return new ModelAndView("/review/reviewView.do?reviewNo="+reply.getReviewNo() + "&pageNo="+reply.getPageNo(), map);
		}
		
		//댓글 수정 
		@RequestMapping(value="login/modifyReviewReply.do", method=RequestMethod.POST)
		public ModelAndView modifyReviewReply(@ModelAttribute ReviewReply reply, Errors errors, HttpSession session, ModelMap map) throws Exception{
			Member member = (Member)session.getAttribute("login_info");
			String userId = member.getId();
			reply.setMemberId(userId);
			System.out.println("수정할 댓글 : "+ reply.getContent());
			System.out.println("로그인한 아이디 : "+userId);
			System.out.println("리뷰번호 : "+reply.getReviewNo());
			System.out.println("댓글번호 : "+reply.getReplyNo());
			System.out.println("페이지번호 : "+reply.getPageNo());
			replyService.modifyReviewReply(reply);
			map.addAttribute("reply", reply);
			return new ModelAndView("redirect:/review/reviewView.do?reviewNo="+reply.getReviewNo() + "&pageNo="+reply.getPageNo(), map);
		}

}
