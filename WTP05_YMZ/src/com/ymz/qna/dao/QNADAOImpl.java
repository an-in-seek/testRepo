package com.ymz.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.qna.vo.QNA;

@Repository
public class QNADAOImpl implements QNADAO {

	private String namespace="qna.dao.QNAMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	//QNA게시판 글 등록
	@Override
	public int insertQNA(QNA qna) {
		return session.insert(namespace+"insertQNA", qna);
	}
	
	@Override
	public void insertQNAComment(QNA qna) {
		//transaction 처리 필요
		//update step+1(원본 글보다 큰건 다 +1)
		session.update(namespace+"addStep", qna);
		//insert 삽입
		session.insert(namespace+"insertQNAComment", qna);
	}

	//QNA게시판 글 수정
	@Override
	public int updateQNA(QNA qna) {
		return session.update(namespace+"updateQNA", qna);
	}

	//QNA게시판 글 제거
	@Override
	public int deleteQNAByNo(int number) {
		return session.delete(namespace+"deleteQNAByNo", number);
	}

	//QNA게시판 글 전체목록 조회
	@Override
	public List<QNA> selectAllQNA(int pageNo) {
		Map map = new HashMap();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		return session.selectList(namespace+"selectAllQNA", map);
	}
	
	// QNA게시판 글 번호로 조회
	@Override
	public QNA selectQNAByNo(int number) {
		return session.selectOne(namespace + "selectQNAByNo", number);
	}
	
	//QNA게시물 조회수 증가
	@Override
	public void updateHitsQNA(int number){
		session.update(namespace + "updateHits", number);
	}
	
	//DB에 있는 데이터 총 개수
	@Override
	public int selectTotalQNACount(){
		return session.selectOne(namespace+"selectTotalQNACount");
	}
}
