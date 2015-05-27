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

	@Override
	public void registerQNA(QNA qna) {
		dao.insertQNA(qna);
	}

	@Override
	public void modifyQNA(QNA qna) {
		dao.updateQNA(qna);
	}

	@Override
	public void removeQNAByNo(int number) {
		dao.deleteQNAByNo(number);
	}

	@Override
	public List<QNA> getQNAList() {
		List<QNA> list = dao.selectAllQNA();
		return list;
	}
	
	@Override
	public QNA getQNAByNo(int number) {
		QNA qna = dao.selectQNAByNo(number);
		return qna;
	}

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
