package com.ymz.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.ymz.common.validator.FAQValidator;
import com.ymz.faq.service.FAQService;
import com.ymz.faq.vo.FAQ;
import com.ymz.member.vo.Member;

@Controller
@RequestMapping("/faq/")
public class FAQController {

	@Autowired
	private FAQService service;

	// FAQ게시물 등록
	@RequestMapping(value="login/write.do", method=RequestMethod.POST)
	public String registerFAQ(@ModelAttribute FAQ faq, Errors errors, HttpServletRequest request) throws Exception{
		new FAQValidator().validate(faq, errors);
		//등록 실패
		if(errors.hasErrors()){
			return "faq/faq_write_form.tiles";
		}
		//등록 성공
		service.registerFAQ(faq);
		return "/faq/faqList.do";//등록후 원래페이지로 이동
	}
	
	// 게시물 수정
	@RequestMapping(value="login/modify.do", method=RequestMethod.POST)
	public String modifyFAQ(@ModelAttribute FAQ faq, Errors errors) throws Exception{
		new FAQValidator().validate(faq, errors);
		//등록 실패
		if(errors.hasErrors()){
			return "faq/faq_modify_form.tiles";
		}
		//등록 성공
		service.modifyFAQ(faq);//수정 처리
		return "/faq/faqList.do";
	}
	
	// FAQ게시판 전체 조회
	@RequestMapping("faqList.do")
	public ModelAndView FAQList(){
		List<FAQ> list = service.getFAQList();
		return new ModelAndView("faq/faq_list.tiles", "faq_list", list);
	}
	
	//FAQ게시물 수정폼으로 이동
	@RequestMapping("login/modifyForm.do")
	public String moveModifyForm(@RequestParam int number, ModelMap map)throws Exception{
		//로그인 체크 - interceptor가 처리
		map.put("faq", service.getFAQByNo(number));
		return "faq/faq_modify_form.tiles";
	}
	
	// 게시물 삭제
	@RequestMapping(value="login/removeFaq.do", method=RequestMethod.POST) //login/removeFaq.do
	public String removeFAQByNo(@ModelAttribute FAQ faq, HttpServletRequest request){
		//로그인 처리는 interceptor가 처리
		System.out.println(faq.getNumber());
		service.removeFAQByNo(faq.getNumber());
		return "/faq/faqList.do";//삭제후 원래 페이지로 이동
	}
	
	// 리스트에서 id로 회원정보 요청한 것 처리 -Ajax 요청처리
	@RequestMapping("findFaqByNo")
	@ResponseBody
	public FAQ findFAQByNo(@RequestParam int number){
		return service.getFAQByNo(number);
	}
	
	// 현재 로그인정보를 체크해서 리턴
	@RequestMapping("findLoginMember")
	@ResponseBody
	public Member findLoginMember(HttpSession session){
		Member member = (Member) session.getAttribute("login_info");
		return member;
	}
}
