package com.ymz.qna.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.common.util.PagingBean;
import com.ymz.qna.dao.QNADAO;
import com.ymz.qna.vo.QNA;

@Service
public class QNAServiceImpl implements QNAService {

	@Autowired
	private QNADAO dao;

	//QNA게시판 글 등록
	@Override
	public void registerQNA(QNA qna) {
		dao.insertQNA(qna);
	}
	
	//QNA게시판 답글 등록
	@Override
	public void registerQNAComment(QNA qna) {
		dao.insertQNAComment(qna);
	}

	//QNA게시판 글 수정
	@Override
	public void modifyQNA(QNA qna) {
		dao.updateQNA(qna);
	}

	//QNA게시판 글 제거
	@Override
	public void removeQNAByNo(int number) {
		dao.deleteQNAByNo(number);
	}

	//QNA게시판 글 전체목록 조회
	@Override
	public Map<String, Object> getQNAListPaging(int pageNo) {
		List<QNA> list = dao.selectAllQNA(pageNo);
		int totalContent = dao.selectTotalQNACount();
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("qna_list", list);
		map.put("pagingBean1", pagingBean); //5개
		return map;
	}
	
	//QNA게시판 글 전체목록 분류별 조회
	@Override
	public Map<String, Object> getQNAListPagingByCategory(int pageNo, String category) {
		List<QNA> list = dao.selectAllQNAByCategory(pageNo, category);
		int totalContent = dao.selectTotalQNACountByCategory(category);
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("qna_list", list);
		map.put("pagingBean1", pagingBean); //5개
		return map;
	}
	
	//QNA게시판 글 전체목록 검색으로 조회
	@Override
	public Map<String, Object> getQNAListPagingBySearch(int pageNo, String text) {
		List<QNA> list = dao.selectAllQNABySearch(pageNo, text);
		int totalContent = dao.selectTotalQNACountBySearch(text);
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("qna_list", list);
		map.put("pagingBean1", pagingBean); //5개
		return map;
	}
	
	//QNA게시판 글 번호로 조회
	@Override
	public QNA getQNAByNo(int number) {
		QNA qna = dao.selectQNAByNo(number);
		return qna;
	}
	
	//리뷰 조회수 증가
	@Override
	public void updateHitsQNA(int number){
		dao.updateHitsQNA(number);
	}

	//트랜젝션 테스트
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED) //자동 롤백은 uncheck 일 경우만 된다. 그래서 rollbackF
	public void transactionTest(QNA q1, QNA q2) throws Exception {
		dao.insertQNA(q1);
		if(true){
			throw new IOException("메롱"); 
		}
		dao.insertQNA(q2);
	}

}
