package com.ymz.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.qna.vo.QNA;

@Repository
public class QNADAOImpl implements QNADAO {

	private String namespace="qna.dao.QNAMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertQNA(QNA qna) {
		return session.insert(namespace+"insertQNA", qna);
	}

	@Override
	public int updateQNA(QNA qna) {
		return session.update(namespace+"updateQNA", qna);
	}

	@Override
	public int deleteQNAByNo(int number) {
		return session.delete(namespace+"deleteQNAByNo", number);
	}

	@Override
	public List<QNA> selectAllQNA() {
		return session.selectList(namespace+"selectAllQNA");
	}

	@Override
	public QNA selectQNAByNo(int number) {
		return session.selectOne(namespace+"selectQNAByNo", number);
	}
}
