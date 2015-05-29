package com.ymz.reviewreply.service;

import com.ymz.reviewreply.vo.ReviewReply;

public interface ReviewReplyService {

	//댓글 등록
	public abstract void registerReviewReply(ReviewReply reply);

	//댓글 수정
	public abstract void modifyReviewReply(ReviewReply reply);
	
	//댓글 삭제
	public abstract void removeReviewReply(String memberId);
	
}
