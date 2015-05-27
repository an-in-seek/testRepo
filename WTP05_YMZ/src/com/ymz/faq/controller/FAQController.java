package com.ymz.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.ymz.faq.service.FAQService;
import com.ymz.faq.vo.FAQ;

@Controller
@RequestMapping("/faq/")
public class FAQController {

	@Autowired
	private FAQService service;
	//ddfasd
	// FAQ게시물 등록
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerFAQ(@ModelAttribute FAQ faq, Errors errors, HttpServletRequest request) throws Exception{
		if(errors.hasErrors()){
			return "faq/register_form.tiles";
		}
		service.registerFAQ(faq);
		return "redirect:/faq/registerSuccess.do?number="+faq.getNumber();
	}
	
	// 게시물 등록 성공
	@RequestMapping("registerSuccess.do")
	public String registerSuccess(@RequestParam int number, ModelMap map) throws Exception{
		FAQ faq = service.getFAQByNo(number);
		System.out.println(faq);
		map.addAttribute("faq", faq);
		return "faq/register_success.tiles";
	}
	
	// FAQ게시판 전체 조회
	@RequestMapping("faqList.do")
	public ModelAndView FAQList(){
		List<FAQ> list = service.getFAQList();
		return new ModelAndView("faq/faq_list.tiles", "faq_list", list);
	}
	
	// 게시물 수정
	@RequestMapping(value="login/modifyFAQInfo.do", method=RequestMethod.POST)
	public String modifyFAQInfo(@ModelAttribute FAQ faq, Errors errors,  HttpServletRequest request)																													throws Exception{
		//로그인 체크 - interceptor가 처리
		service.modifyFAQ(faq);//수정 처리
		return "faq/faq_info.tiles";
	}
	
	// 게시물 삭제
	@RequestMapping("login/removeFAQ.do")
	public String removeFAQByNo(@ModelAttribute FAQ faq, HttpServletRequest request, ModelMap map){
		//로그인 처리는 interceptor가 처리
		int number = Integer.parseInt(request.getParameter("number"));
		service.removeFAQByNo(number);
		return "main.tiles";//삭제후 메인페이지로 이동
	}
	
	// 리스트에서 id로 회원정보 요청한 것 처리 -Ajax 요청처리
	@RequestMapping("findFAQByNo")
	@ResponseBody
	public FAQ findFAQByNo(@RequestParam int number){
		return service.getFAQByNo(number);
	}
}
