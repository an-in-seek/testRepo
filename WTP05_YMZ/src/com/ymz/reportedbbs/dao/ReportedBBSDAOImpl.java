package com.ymz.reportedbbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.reportedbbs.vo.ReportedBBS;

@Repository
public class ReportedBBSDAOImpl implements ReportedBBSDAO {

	private String namespace="reported.dao.ReportedBBSMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<ReportedBBS> selectAllReportedBBS(int pageNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		return session.selectList(namespace+"selectAllReportedBBS", map);
	}
	
	@Override
	public int selectTotalReportedBBSCount(){
		return session.selectOne(namespace+"selectTotalReportedBBSCount");
	}
}
