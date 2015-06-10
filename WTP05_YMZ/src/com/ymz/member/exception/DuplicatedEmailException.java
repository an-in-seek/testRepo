package com.ymz.member.exception;

public class DuplicatedEmailException extends Exception {
	public DuplicatedEmailException(){}
	public DuplicatedEmailException(String message){
		super(message);
	}
}
