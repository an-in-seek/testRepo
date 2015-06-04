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
	
	//분류별 게시물 조회
	public abstract List<QNA> selectAllQNAByCategory(int pageNo, String category);
	
	//검색으로 게시물 조회
	public abstract List<QNA> selectAllQNABySearch(int pageNo, String text);
	
	//게시물 ID번호로 조회
	public abstract QNA selectQNAByNo(int number);

	//게시판 DB에 있는 모든 데이터들의 개수를 카운트
	public abstract int selectTotalQNACount();

	//게시판 DB에 있는 분류별 모든 데이터들의 개수를 카운트
	public abstract int selectTotalQNACountByCategory(String category);
	
	//제목+내용 기준으로 QNA게시물 조회하기
	public abstract int selectTotalQNACountBySearch(String title);
	
	//게시물 조회수 증가
	public abstract void updateHitsQNA(int number);

}