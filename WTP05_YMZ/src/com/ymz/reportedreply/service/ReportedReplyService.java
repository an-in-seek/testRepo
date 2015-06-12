package com.ymz.reportedreply.service;

import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.reportedreply.vo.ReportedReply;

public interface ReportedReplyService {

	public abstract Map<String, Object> getReportedReplyList(int pageNo);

	/*public insert()*/
	//신고된 게시물 등록
	public abstract void registerReportedReply(ReportedReply reportedReply);

}