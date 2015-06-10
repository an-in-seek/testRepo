package com.ymz.reportedbbs.service;

import java.util.Map;

import com.ymz.reportedbbs.vo.ReportedBBS;

public interface ReportedBBSService {

	public abstract Map<String, Object> getReportedBBSList(int pageNo);

	public abstract void registerReportedBBS(ReportedBBS reportedBBS);

}