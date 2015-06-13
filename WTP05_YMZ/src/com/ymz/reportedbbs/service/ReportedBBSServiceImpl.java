package com.ymz.reportedbbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public Map<String, Object> getReportedBBSListById(int pageNo, String memberId){
		List<ReportedBBS> list = dao.selectAllReportedBBSById(pageNo, memberId);
		int totalContent = dao.selectTotalReportedBBSCountById(memberId);
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		HashMap map = new HashMap();
		map.put("reportList", list);
		map.put("pagingBean", pagingBean); //5개
		return map;
	}
	
	/*public insert()*/
	//신고된 게시물 등록
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
	public void registerReportedBBS(ReportedBBS reportedBBS) {
		dao.insertReportedBBS(reportedBBS);
	}

}
