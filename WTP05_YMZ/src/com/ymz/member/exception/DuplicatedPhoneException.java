package com.ymz.member.exception;

public class DuplicatedPhoneException extends Exception {
	public DuplicatedPhoneException(){}
	public DuplicatedPhoneException(String message){
		super(message);
	}
}
