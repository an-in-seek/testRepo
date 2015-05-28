package com.ymz.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.faq.vo.FAQ;

@Repository
public class FAQDAOImpl implements FAQDAO {

	private String namespace="faq.dao.FAQMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	//FAQ게시판 글 등록
	@Override
	public int insertFAQ(FAQ faq) {
		return session.insert(namespace+"insertFAQ", faq);
	}

	//FAQ게시판 글 수정
	@Override
	public int updateFAQ(FAQ faq) {
		return session.update(namespace+"updateFAQ", faq);
	}

	//FAQ게시판 글 삭제
	@Override
	public int deleteFAQByNo(int number) {
		return session.delete(namespace+"deleteFAQByNo", number);
	}

	//FAQ게시판 전체 글 조회
	@Override
	public List<FAQ> selectAllFAQ() {
		return session.selectList(namespace+"selectAllFAQ");
	}

	//FAQ게시판 글 번호로 조회
	@Override
	public FAQ selectFAQByNo(int number) {
		return session.selectOne(namespace+"selectFAQByNo", number);
	}
	
}
