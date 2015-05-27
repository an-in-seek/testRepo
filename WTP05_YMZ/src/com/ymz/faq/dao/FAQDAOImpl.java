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
	
	@Override
	public int insertFAQ(FAQ faq) {
		return session.insert(namespace+"insertFAQ", faq);
	}

	@Override
	public int updateFAQ(FAQ faq) {
		return session.update(namespace+"updateFAQ", faq);
	}

	@Override
	public int deleteFAQByNo(int number) {
		return session.delete(namespace+"deleteFAQByNo", number);
	}

	@Override
	public List<FAQ> selectAllFAQ() {
		return session.selectList(namespace+"selectAllFAQ");
	}

	@Override
	public FAQ selectFAQByNo(int number) {
		return session.selectOne(namespace+"selectFAQByNo", number);
	}
	
}
