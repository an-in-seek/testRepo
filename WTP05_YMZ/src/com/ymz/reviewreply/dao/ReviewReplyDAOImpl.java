package com.ymz.reviewreply.dao;

import java.util.List;

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
	public void deleteReviewReply(ReviewReply reply) {
		session.delete(namespace + "deleteReply", reply);
	}

	//댓글목록
	@Override
	public List<ReviewReply> selectAllReply() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "selectAllReply");
	}
}
