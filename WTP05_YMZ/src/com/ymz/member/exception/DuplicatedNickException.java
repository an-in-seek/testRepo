package com.ymz.member.exception;

public class DuplicatedNickException extends Exception {
	public DuplicatedNickException(){}
	public DuplicatedNickException(String message){
		super(message);
	}
}
