package com.ymz.qna.dao;

import java.util.List;

import com.ymz.qna.vo.QNA;

public interface QNADAO {

	//게시물 삽입
	public abstract int insertQNA(QNA qna);
	
	//게시물 답글 삽입
	public abstract void insertQNAComment(QNA qna);
	
	//게시물 수정
	public abstract int updateQNA(QNA qna);
	
	//게시물 삭제
	public abstract int deleteQNAByNo(int number);
	
	//게시물 조회
	public abstract List<QNA> selectAllQNA(int pageNO);
	
	//게시물 ID번호로 조회
	public abstract QNA selectQNAByNo(int number);

	//게시판 DB에 있는 모든 정보들의 개수를 카운트
	public abstract int selectTotalQNACount();

	//게시물 조회수 증가
	public abstract void updateHitsQNA(int number);

	

}