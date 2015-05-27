package com.mycom.member.model.service;

import java.util.List;
import java.util.Map;

import com.mycom.member.exception.DuplicatedIdException;
import com.mycom.member.vo.Member;

public interface MemberService {

	/**
	 * 가입 처리 메소드
	 * @param member 가입 정보
	 * @throws DuplicatedIdException 중복된 아이디일 경우 발생
	 */
	public abstract void joinMember(Member member) throws DuplicatedIdException;

	/**
	 * 전체 회원 목록 조회 처리
	 * @return List<Member>
	 */
	public abstract List<Member> getMemberList();

	/* **********************************************
	 * 페이징 처리 service 메소드
	 * **********************************************/
	/**
	 * 전체 회원 목록 조회 처리 - Paging 처리
	 *  - 목록에 뿌려줄 회원리스트(List<Member>)와 페이징 처리를 PagingBean 객체를 생성해 Map에 넣어 리턴
	 * @param page : 조회할 page 번호
	 * @return Map
	 */
	public abstract Map getMemberListPaging(int pageNo);

	/**
	 * ID로 회원 조회 메소드
	 * @param id : 조회할 회원 ID
	 * @return
	 */
	public abstract Member getMemberById(String id);

	/**
	 * 회원 정보 수정 처리 메소드
	 * @param member 수정할 회원 전보
	 */
	public abstract void modifyMember(Member member);

	/**
	 * 회원 탈퇴 메소드
	 * @param id 탈퇴할 회원 ID
	 */
	public abstract void removeMemberById(String id);

	public abstract void transactionTest(Member m1, Member m2) throws Exception;
}