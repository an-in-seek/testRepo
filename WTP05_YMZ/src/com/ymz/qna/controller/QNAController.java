package com.ymz.qna.controller;

import java.util.Map;

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

import com.ymz.qna.service.QNAService;
import com.ymz.qna.vo.QNA;

@Controller
@RequestMapping("/qna/")
public class QNAController {

	@Autowired
	private QNAService service;
	
	//QNA게시물 등록
	@RequestMapping(value="qnaWrite.do", method=RequestMethod.POST)
	public String registerQNA(@ModelAttribute QNA qna, Errors errors) throws Exception{
		if(errors.hasErrors()){
			return "qna/qna_write_form.tiles";
		}
		service.registerQNA(qna);
		return "redirect:/qna/qnaView.do?number="+qna.getNumber();
	}
	
	//QNA게시물 전체목록 조회(페이징)
	@RequestMapping("qnaList.do")
	public ModelAndView QNAList(@RequestParam(defaultValue="1")int page){
		Map map = service.getQNAListPaging(page);
		return new ModelAndView("qna/qna_list.tiles", map);
	}
	
	//QNA게시물 번호로 정보조회
		@RequestMapping("qnaView.do")
		public ModelAndView QNAView(@RequestParam int qnaNo){
			QNA qna = service.getQNAByNo(qnaNo);
			return new ModelAndView("qna/qna_view.tiles", "qna", qna);
		}
	
	// 게시물 수정
		@RequestMapping(value="login/modifyQnaInfo.do", method=RequestMethod.POST)
		public String modifyQNAInfo(@ModelAttribute QNA qna, Errors errors,  HttpServletRequest request)																													throws Exception{
			//로그인 체크 - interceptor가 처리
			service.modifyQNA(qna);//수정 처리
			return "qna/qna_info.tiles";
		}
		
		// 게시물 삭제
		@RequestMapping("login/removeQna.do")
		public String removeQNAByNo(@ModelAttribute QNA qna, HttpServletRequest request, ModelMap map){
			//로그인 처리는 interceptor가 처리
			int number = Integer.parseInt(request.getParameter("number"));
			service.removeQNAByNo(number);
			return "main.tiles";//삭제후 메인페이지로 이동
		}
		
		// 리스트에서 id로 회원정보 요청한 것 처리 -Ajax 요청처리
		@RequestMapping("findQnaByNo")
		@ResponseBody
		public QNA findQNAByNo(@RequestParam int number){
			return service.getQNAByNo(number);
		}
}
