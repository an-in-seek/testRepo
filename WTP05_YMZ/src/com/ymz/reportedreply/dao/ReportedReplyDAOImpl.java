package com.ymz.reportedreply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.reportedreply.vo.ReportedReply;

@Repository
public class ReportedReplyDAOImpl implements ReportedReplyDAO {

	private String namespace="reported.dao.ReportedReplyMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<ReportedReply> selectAllReportedReply(int pageNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		return session.selectList(namespace+"selectAllReportedReply", map);
	}
	
	@Override
	public int selectTotalReportedReplyCount(){
		return session.selectOne(namespace+"selectTotalReportedReplyCount");
	}
	
	@Override
	public int insertReportedReply(ReportedReply reportedReply) {
		return session.insert(namespace+"insertReportedReply", reportedReply);
	}
}
