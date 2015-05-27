package com.ymz.faq.service;

import java.util.List;

import com.ymz.faq.vo.FAQ;

public interface FAQService {

	//게시물 등록
	public abstract void registerFAQ(FAQ faq);
	
	//게시물 수정
	public abstract void modifyFAQ(FAQ faq);
	
	//게시물 삭제
	public abstract void removeFAQByNo(int number);
	
	//게시물 조회
	public abstract List<FAQ> getFAQList();
	
	//게시물 ID번호로 조회
	public abstract FAQ getFAQByNo(int number);
	
	public abstract void transactionTest(FAQ f1, FAQ f2) throws Exception;
}