package com.ymz.reportedreply.dao;

import java.util.List;

import com.ymz.reportedreply.vo.ReportedReply;

public interface ReportedReplyDAO {

	public abstract List<ReportedReply> selectAllReportedReply(int pageNo);

	public abstract int selectTotalReportedReplyCount();

	public abstract int insertReportedReply(ReportedReply reportedReply);

}