package com.ymz.reviewreply.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.reviewreply.vo.ReviewReply;

@Repository
public class ReviewReplyDAOImpl implements ReviewReplyDAO {

	@Autowired
	private SqlSessionTemplate session;
	private String namespace = "review.dao.ReviewReplyMapper.";
	
	
	//댓글 등록
	@Override
	public void insertReviewReply(ReviewReply reply) {
		session.insert(namespace + "insertReply", reply);
	}

	//댓글 수정
	@Override
	public void updateReviewReply(ReviewReply reply) {
		session.update(namespace + "updateReply", reply);
	}

	//댓글 삭제
	@Override
	public void deleteReviewReply(String memberId) {
		session.delete(namespace + "deleteReview", memberId);
	}
}
