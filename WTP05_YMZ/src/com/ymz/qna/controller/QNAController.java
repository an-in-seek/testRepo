package com.ymz.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ymz.qna.service.QNAService;
import com.ymz.qna.vo.QNA;

@Controller
@RequestMapping("/qna/")
public class QNAController {

	@Autowired
	private QNAService service;
	
	//QNA게시물 등록
	@RequestMapping(value="qna_write.do", method=RequestMethod.POST)
	public String registerQNA(@ModelAttribute QNA qna, Errors errors){
		if(errors.hasErrors()){
			return "qna/qna_write_form.tiles";
		}
		service.registerQNA(qna);
		return "redirect:/qna/qna_view.do?number="+qna.getNumber();
	}
	
	//QNA게시판 전체 조회
	@RequestMapping("qnaList.do")
	public ModelAndView QNAList(){
		List<QNA> list = service.getQNAList();
		return new ModelAndView("qna/qna_list.tiles", "qna_list", list);
	}
}
