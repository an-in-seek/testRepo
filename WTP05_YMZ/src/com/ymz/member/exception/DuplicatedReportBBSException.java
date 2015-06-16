package com.ymz.member.exception;

public class DuplicatedReportBBSException extends Exception {	// 리뷰게시판 추천 중복 Exception
	public DuplicatedReportBBSException(){}
	public DuplicatedReportBBSException(String message){
		super(message);
	}
}
