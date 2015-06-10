package com.ymz.reportedbbs.dao;

import java.util.List;

import com.ymz.reportedbbs.vo.ReportedBBS;

public interface ReportedBBSDAO {

	public abstract List<ReportedBBS> selectAllReportedBBS(int pageNo);

	public abstract int selectTotalReportedBBSCount();

}