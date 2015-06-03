package com.ymz.reviewreply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.reviewreply.dao.ReviewReplyDAO;
import com.ymz.reviewreply.vo.ReviewReply;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Autowired
	private ReviewReplyDAO dao;
	
	//댓글 등록
	@Override
	public void registerReviewReply(ReviewReply reply) {
		dao.insertReviewReply(reply);
	}

	//댓글 수정
	@Override
	public void modifyReviewReply(ReviewReply reply) {
		dao.updateReviewReply(reply);
	}

	//댓글 삭제
	@Override
	public void removeReviewReply(ReviewReply reply) {
		dao.deleteReviewReply(reply);
	}

	//댓글 목록
	@Override
	public Map<String, Object> getReplyList() {
		List<ReviewReply> list = dao.selectAllReply();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewReplyList", list);
		return map;
	}

}
