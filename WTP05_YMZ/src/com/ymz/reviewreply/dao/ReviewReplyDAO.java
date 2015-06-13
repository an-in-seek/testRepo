package com.ymz.reviewreply.dao;

import java.util.List;

import com.ymz.reviewreply.vo.ReviewReply;

public interface ReviewReplyDAO {

	//댓글 등록
	public abstract void insertReviewReply(ReviewReply reply);
	
	//댓글 수정
	public abstract void updateReviewReply(ReviewReply reply);
	
	//댓글 삭제
	public abstract void deleteReviewReply(ReviewReply reply);
	    
	//댓글 목록
	public abstract List<ReviewReply> selectAllReply(int reviewNo);
	
	//댓글 내용 갖고오기
	public abstract ReviewReply getReviewReplyContent(int replyNo);

	//아이디(ID)로 댓글 목록 조회
	List<ReviewReply> selectReviewReplyById(int pageNo, String memberId);

	//아이디(ID)와 일치하는 데이터들의 총 개수
	int selectReviewReplyCountById(String memberId);
	
	
}
