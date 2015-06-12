package com.ymz.reportedbbs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ymz.reportedbbs.service.ReportedBBSService;
import com.ymz.reportedreply.service.ReportedReplyService;

@Controller
@RequestMapping("/reported/")
public class ReportedBBSController {
   
	@Autowired
	private ReportedBBSService service;
	
	@Autowired
	private ReportedReplyService replyService;
	
	//QNA게시물 전체목록 조회하는 리스트 페이지로 이동
	@RequestMapping("login/admin/reportedList.do")
	public String ReportedBBSList(@RequestParam(defaultValue="1")int pageNo, @RequestParam(defaultValue="1")int pageNo2, ModelMap map){
		Map<String, Object> bbsMap = service.getReportedBBSList(pageNo);
		Map<String, Object> replyMap = replyService.getReportedReplyList(pageNo2);
		map.put("bbsMap", bbsMap);
		map.put("replyMap", replyMap);
		return "reported/reported_bbs_list.tiles";
	}
}
