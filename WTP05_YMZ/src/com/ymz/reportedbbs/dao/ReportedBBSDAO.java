package com.ymz.reportedbbs.dao;

import java.util.List;

import com.ymz.reportedbbs.vo.ReportedBBS;

public interface ReportedBBSDAO {

	public abstract List<ReportedBBS> selectAllReportedBBS(int pageNo);

	public abstract int selectTotalReportedBBSCount();

	public abstract int insertReportedBBS(ReportedBBS reportedBBS);

	int selectTotalReportedBBSCountById(String memberId);

	List<ReportedBBS> selectAllReportedBBSById(int pageNo, String memberId);

	public abstract int duplicatedCheck(ReportedBBS bbs);	// 중복 체크

}