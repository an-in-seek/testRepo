package com.ymz.qna.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	public List<QNA> getQNAList() {
		List<QNA> list = dao.selectAllQNA();
		return list;
	}
	
	//QNA게시판 글 번호로 조회
	@Override
	public QNA getQNAByNo(int number) {
		QNA qna = dao.selectQNAByNo(number);
		return qna;
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
