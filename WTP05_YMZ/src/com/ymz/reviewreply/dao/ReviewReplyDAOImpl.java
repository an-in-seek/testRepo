package com.ymz.reviewreply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
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
	public List<ReviewReply> selectAllReply(int reviewNo) {
		return session.selectList(namespace + "selectAllReply", reviewNo);
	}

	//댓글 내용 갖고오기
	@Override
	public ReviewReply getReviewReplyContent(int replyNo) {
		return session.selectOne(namespace + "selectReviewReplyByNo", replyNo);
	}
	
	//회원 아이디(ID)로 리뷰 댓글 리스트 조회하기
	@Override
	public List<ReviewReply> selectReviewReplyById(int pageNo, String memberId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return session.selectList(namespace+"selectReviewReplyById", map);
	}
	
	//회원 아이디(ID)와 일치하는 정보들의 총 개수
	@Override
	public int selectReviewReplyCountById(String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);  
		return session.selectOne(namespace+"selectReviewReplyCountById", map);
	}
}
