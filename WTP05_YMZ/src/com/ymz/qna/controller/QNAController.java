package com.ymz.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ymz.qna.service.QNAService;

@Controller
@RequestMapping("/qna/")
public class QNAController {

	@Autowired
	private QNAService service;
	
	//QNA게시물 등록
/*	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerQNA(@ModelAttribute QNA qna, Errors errors){
		if(errors.hasErrors()){
			return "qna/register_form.tiles";
		}
		service.registerQNA(qna);
		return "redirect:/qna/registerSuccess.do?number="+qna.getNumber();
	}*/
	
/*	//QNA게시판 전체 조회
	public ModelAndView QNAList(){
		List<QNA> list = service.getQNAList();
		return new ModelAndView("qna/qna_list.tiles", "qna_list", list);
	}*/
}
