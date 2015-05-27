package com.ymz.faq.dao;

import java.util.List;

import com.ymz.faq.vo.FAQ;

public interface FAQDAO {

	//게시물 삽입
	public abstract int insertFAQ(FAQ faq);
	
	//게시물 수정
	public abstract int updateFAQ(FAQ faq);
	
	//게시물 삭제
	public abstract int deleteFAQByNo(int number);
	
	//게시물 조회
	public abstract List<FAQ> selectAllFAQ();
	
	//게시물 ID번호로 조회
	public abstract FAQ selectFAQByNo(int number);
}