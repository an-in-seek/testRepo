package com.ymz.reportedreply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.common.util.PagingBean;
import com.ymz.reportedreply.dao.ReportedReplyDAO;
import com.ymz.reportedreply.vo.ReportedReply;

@Service
public class ReportedReplyServiceImpl implements ReportedReplyService {

	@Autowired
	private ReportedReplyDAO dao;
	
	@Override
	public Map<String, Object> getReportedReplyList(int pageNo){
		List<ReportedReply> list = dao.selectAllReportedReply(pageNo);
		int totalContent = dao.selectTotalReportedReplyCount();
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		HashMap map = new HashMap();
		map.put("reported_list", list);
		map.put("pagingBean", pagingBean); //5개
		return map;
	}
	
	/*public insert()*/
	//신고된 게시물 등록
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
	public void registerReportedReply(ReportedReply reportedReply) {
		dao.insertReportedReply(reportedReply);
	}
}
