package com.ymz.reportedbbs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ymz.reportedbbs.service.ReportedBBSService;

@Controller
@RequestMapping("/reported/")
public class ReportedBBSController {
   
	@Autowired
	private ReportedBBSService service;
	
	//QNA게시물 전체목록 조회하는 리스트 페이지로 이동
	@RequestMapping("login/reportedList.do")
	public ModelAndView ReportedBBSList(@RequestParam(defaultValue="1")int pageNo){
		Map<String, Object> map = service.getReportedBBSList(pageNo);
		return new ModelAndView("reported/reported_bbs_list.tiles", map);
	}
}
