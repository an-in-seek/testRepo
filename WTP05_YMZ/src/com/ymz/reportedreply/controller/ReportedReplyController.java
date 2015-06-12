package com.ymz.reportedreply.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ymz.reportedreply.service.ReportedReplyService;

@Controller
@RequestMapping("/reportedReply/")
public class ReportedReplyController {

	@Autowired
	private ReportedReplyService service;
	
	@RequestMapping("login/admin/reportedList.do")
	public ModelAndView ReportedReplyList(@RequestParam(defaultValue="1")int pageNo){
		Map<String, Object> map = service.getReportedReplyList(pageNo);
		return new ModelAndView("reported/reported_reply_list.tiles", map);
	}
}
