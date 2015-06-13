package com.ymz.reviewreply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.common.util.PagingBean;
import com.ymz.review.vo.Review;
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
	public Map<String, Object> getReplyList(int reviewNo) {
		List<ReviewReply> list = dao.selectAllReply(reviewNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewReplyList", list);
		return map;
	}

	//댓글 내용 갖고오기
	@Override
	public ReviewReply getReviewReplyContent(int replyNo) {
		return dao.getReviewReplyContent(replyNo);
	}
	
	//아이디(ID)로 댓글 목록 조회
	@Override
	public Map<String, Object> getReviewReplyListPagingById(int pageNo, String memberId) {
		List<ReviewReply> list = dao.selectReviewReplyById(pageNo, memberId); // 오늘 최고 조회수 글 목록 가져오기
		int totalContent = dao.selectReviewReplyCountById(memberId); // 수정 : 매개변수 추가
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyList", list);
		map.put("pagingBean", pagingBean);
		return map;
	}
	

}
