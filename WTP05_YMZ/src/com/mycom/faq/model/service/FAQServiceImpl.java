package com.mycom.faq.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mycom.faq.model.dao.FAQDAO;
import com.mycom.faq.vo.FAQ;

@Service
public class FAQServiceImpl implements FAQService {

	@Autowired
	private FAQDAO dao;

	@Override
	public void registerFAQ(FAQ faq) {
		dao.insertFAQ(faq);
	}

	@Override
	public void modifyFAQ(FAQ faq) {
		dao.updateFAQ(faq);
	}

	@Override
	public void removeFAQByNo(int number) {
		dao.deleteFAQByNo(number);
	}

	@Override
	public List<FAQ> getFAQList() {
		List<FAQ> list = dao.selectAllFAQ();
		return list;
	}
	
	@Override
	public FAQ getFAQByNo(int number) {
		FAQ faq = dao.selectFAQByNo(number);
		return faq;
	}

	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED) //자동 롤백은 uncheck 일 경우만 된다. 그래서 rollbackF
	public void transactionTest(FAQ f1, FAQ f2) throws Exception {
		dao.insertFAQ(f1);
		if(true){
			throw new IOException("메롱"); 
		}
		dao.insertFAQ(f2);
	}

}
