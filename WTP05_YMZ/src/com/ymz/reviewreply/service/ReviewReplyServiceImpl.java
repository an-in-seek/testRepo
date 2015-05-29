package com.ymz.reviewreply.service;

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
	public void removeReviewReply(String memberId) {
		dao.deleteReviewReply(memberId);
	}

}
