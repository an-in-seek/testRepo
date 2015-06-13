package com.ymz.reviewreply.service;

import java.util.Map;

import com.ymz.reviewreply.vo.ReviewReply;

public interface ReviewReplyService {

	//댓글 등록
	public abstract void registerReviewReply(ReviewReply reply);

	//댓글 수정
	public abstract void modifyReviewReply(ReviewReply reply);
	
	//댓글 삭제
	public abstract void removeReviewReply(ReviewReply reply);
	
	//댓글 목록
	public abstract Map<String, Object> getReplyList(int reviewNo);

	//댓글 내용갖고오기
	public abstract ReviewReply getReviewReplyContent(int replyNo);

	//회원 아이디(ID)로 댓글정보 조회
	Map<String, Object> getReviewReplyListPagingById(int pageNo, String memberId);
	
}
