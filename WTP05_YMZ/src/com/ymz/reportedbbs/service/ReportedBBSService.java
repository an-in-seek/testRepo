package com.ymz.reportedbbs.service;

import java.util.Map;

import com.ymz.reportedbbs.vo.ReportedBBS;

public interface ReportedBBSService {

	public abstract Map<String, Object> getReportedBBSList(int pageNo);

	public abstract void registerReportedBBS(ReportedBBS reportedBBS);

	Map<String, Object> getReportedBBSListById(int pageNo, String memberId);

	public abstract int duplicatedCheckReview(ReportedBBS bbs); // 중복 체크 메소드

}