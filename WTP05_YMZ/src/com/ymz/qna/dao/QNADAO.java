package com.ymz.qna.dao;

import java.util.List;

import com.ymz.qna.vo.QNA;

public interface QNADAO {

	//게시물 삽입
	public abstract int insertQNA(QNA qna);
	
	//게시물 수정
	public abstract int updateQNA(QNA qna);
	
	//게시물 삭제
	public abstract int deleteQNAByNo(int number);
	
	//게시물 조회
	public abstract List<QNA> selectAllQNA();
	
	//게시물 ID번호로 조회
	public abstract QNA selectQNAByNo(int number);
}