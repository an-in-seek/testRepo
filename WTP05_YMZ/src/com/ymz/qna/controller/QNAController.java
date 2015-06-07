package com.ymz.qna.controller;

import java.util.List;
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

import com.ymz.common.category.service.CategoryService;
import com.ymz.common.category.vo.Category;
import com.ymz.common.validator.QNAValidator;
import com.ymz.member.vo.Member;
import com.ymz.qna.service.QNAService;
import com.ymz.qna.vo.QNA;

@Controller
@RequestMapping("/qna/")
public class QNAController {

	@Autowired
	private QNAService service;
	
	@Autowired
	private CategoryService categoryService;
	
	//------------------------------------------비지니스 로직 처리하기-----------------------------------------
	//QNA게시물 등록
	@RequestMapping(value="login/write.do", method=RequestMethod.POST)
	public String registerQNA(@ModelAttribute QNA qna, Errors errors, HttpSession session, ModelMap map) throws Exception{
		new QNAValidator().validate(qna, errors);
		if(errors.hasErrors()){
			return "qna/qna_write_form.tiles";
		}//등록 성공
		//현재 로그인되어있는 사용자 아이디정보 삽입
		Member member = (Member)session.getAttribute("login_info");
		qna.setMemberId(member.getId());
		service.registerQNA(qna);
		return "redirect:/qna/qnaList.do";
	}
	
	//QNA답글 등록
	@RequestMapping(value="login/writeComment.do", method=RequestMethod.POST)
	public String registerQNAComment(@ModelAttribute QNA qna, Errors errors, HttpSession session, ModelMap map) throws Exception{
		if(errors.hasErrors()){
			return "qna/qna_comment_form.tiles";
		}//등록 성공
		//현재 로그인되어있는 사용자 아이디정보 삽입
		Member member = (Member)session.getAttribute("login_info");
		qna.setMemberId(member.getId());
		service.registerQNAComment(qna);
		return "redirect:/qna/qnaList.do";
	}
	
	//QNA게시물 전체목록 검색으로 조회(페이징)
	@RequestMapping("searchQna.do")
	public ModelAndView QNAListBySearch(@RequestParam String text){
		int pageNo = 1;
		Map<String, Object> map = service.getQNAListPagingBySearch(pageNo, text);
		return new ModelAndView("qna/qna_list.tiles", map);
	}
	
	//QNA게시물 번호로 정보를 조회하기 위해 View페이지로 이동
	@RequestMapping("qnaView.do")
	public ModelAndView moveQNAView(@RequestParam int qnaNo){
		QNA qna = service.getQNAByNo(qnaNo);
		return new ModelAndView("qna/qna_view.tiles", "qna", qna);
	}
	
	// 조회수 증가
	@RequestMapping("ajax/updateHits.do")
	@ResponseBody
	public int searchReview(@RequestParam int number, ModelMap map){
		service.updateHitsQNA(number);
		QNA qna = service.getQNAByNo(number);
		int hits = qna.getHits();
		return hits;
	}
	
	// 게시물 수정
	@RequestMapping(value="login/modifyQna.do", method=RequestMethod.POST)
	public String modifyQNAInfo(@ModelAttribute QNA qna, Errors errors)throws Exception{
		//로그인 체크 - interceptor가 처리
		service.modifyQNA(qna);//수정 처리
		return "redirect:/qna/qnaView.do?qnaNo="+qna.getNumber();
	}
	
	// 게시물 삭제
	@RequestMapping("login/removeQna.do")
	public String removeQNAByNo(@ModelAttribute QNA qna){
		//로그인 처리는 interceptor가 처리
		service.removeQNAByNo(qna.getNumber());
		return "redirect:/qna/qnaList.do";//삭제후 메인페이지로 이동
	}
	
	//------------------------------------------폼으로 이동시키기-----------------------------------------
	//QNA게시물 전체목록 조회하는 리스트 페이지로 이동
	@RequestMapping("qnaList.do")
	public ModelAndView QNAList(@RequestParam(defaultValue="1")int pageNo, @RequestParam(defaultValue="전체보기") String category){
		Map<String, Object> map = service.getQNAListPagingByCategory(pageNo, category);
		List<Category> categoryList = categoryService.getCategoryByFirstId("F-3"); //고객센터 QNA게시판 카테고리 정보
		map.put("categoryList", categoryList);
		map.put("category", category);
		System.out.println("카테고리 : "+category);
		return new ModelAndView("qna/qna_list.tiles", map);
	}
	
	//QNA게시물 전체목록 분류별로 조회해서 리스트 페이지로 이동
		@RequestMapping("qnaListByCategory.do")
		public ModelAndView QNAListByCategory(@ModelAttribute QNA qna, @RequestParam(defaultValue="1") int pageNo){
			String category = qna.getCategory();
			Map<String, Object> map = service.getQNAListPagingByCategory(pageNo, category);
			List<Category> categoryList = categoryService.getCategoryByFirstId("F-3"); //고객센터 QNA게시판 카테고리 정보
			map.put("categoryList", categoryList);
			map.put("category", category);
			return new ModelAndView("qna/qna_list.tiles", map);
		}
		
	// 게시물 등록폼으로 이동
	@RequestMapping("login/writeForm.do")//로그인 체크 - interceptor가 처리
	public String moveQNAWriteForm(ModelMap map)throws Exception{
		List<Category> categoryList = categoryService.getCategoryByFirstId("F-3"); //고객센터 QNA게시판 카테고리 정보
		map.put("categoryList", categoryList);
		return "qna/qna_write_form.tiles";
	}
	
	// 게시물 수정폼으로 이동
	@RequestMapping("login/modifyForm.do")//로그인 체크 - interceptor가 처리
	public String moveQNAModifyForm(@RequestParam int number, ModelMap map)throws Exception{
		QNA qna = service.getQNAByNo(number);
		List<Category> categoryList = categoryService.getCategoryByFirstId("F-3"); //고객센터 QNA게시판 카테고리 정보
		map.put("qna", qna);
		map.put("categoryList", categoryList);
		return "qna/qna_modify_form.tiles";
	}
		
	// 게시물 답글폼으로 이동
	@RequestMapping("login/commentForm.do")//로그인 체크 - interceptor가 처리
	public String moveQNACommentForm(@RequestParam int number, ModelMap map)throws Exception{
		QNA qna = service.getQNAByNo(number);
		List<Category> categoryList = categoryService.getCategoryByFirstId("F-3"); //고객센터 QNA게시판 카테고리 정보
		map.put("qna", qna);
		map.put("categoryList", categoryList);
		return "qna/qna_comment_form.tiles";
	}
	
	
	//------------------------------------------Ajax 처리-----------------------------------------
	// 리스트에서 id로 회원정보 요청한 것 처리 -Ajax 요청처리
	@RequestMapping("findQnaByNo")
	@ResponseBody
	public QNA findQNAByNo(@RequestParam int number){
		return service.getQNAByNo(number);
	}
	
	// 현재 로그인정보를 체크해서 리턴
	@RequestMapping("findLoginMember")
	@ResponseBody
	public Member findLoginMember(HttpSession session){
		Member member = (Member) session.getAttribute("login_info");
		return member;
	}
}
