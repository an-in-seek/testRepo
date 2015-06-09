package com.ymz.reportedbbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.common.util.PagingBean;
import com.ymz.reportedbbs.dao.ReportedBBSDAO;
import com.ymz.reportedbbs.vo.ReportedBBS;

@Service
public class ReportedBBSServiceImpl implements ReportedBBSService {

	@Autowired
	private ReportedBBSDAO dao;
	
	@Override
	public Map<String, Object> getReportedBBSList(int pageNo){
		List<ReportedBBS> list = dao.selectAllReportedBBS(pageNo);
		int totalContent = dao.selectTotalReportedBBSCount();
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("reported_list", list);
		map.put("pagingBean", pagingBean); //5개
		return map;
	}
}
