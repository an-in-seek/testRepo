package com.ymz.reviewreply.dao;

import com.ymz.reviewreply.vo.ReviewReply;

public interface ReviewReplyDAO {

	//댓글 등록
	public abstract void insertReviewReply(ReviewReply reply);
	
	//댓글 수정
	public abstract void updateReviewReply(ReviewReply reply);
	
	//댓글 삭제
	public abstract void deleteReviewReply(String memberId);
	
}
