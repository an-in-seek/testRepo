package com.ymz.qna.service;

import java.util.List;

import com.ymz.qna.vo.QNA;

public interface QNAService {

	//게시물 등록
		public abstract void registerQNA(QNA qna);
		
		//게시물 수정
		public abstract void modifyQNA(QNA qna);
		
		//게시물 삭제
		public abstract void removeQNAByNo(int number);
		
		//게시물 조회
		public abstract List<QNA> getQNAList();
		
		//게시물 ID번호로 조회
		public abstract QNA getQNAByNo(int number);
		
		public abstract void transactionTest(QNA q1, QNA q2) throws Exception;
}