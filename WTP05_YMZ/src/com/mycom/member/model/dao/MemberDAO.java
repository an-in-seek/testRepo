package com.mycom.member.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.mycom.member.vo.Member;

public interface MemberDAO {

	/**
	 * id로 회원 정보를 조회하여 return하는 메소드
	 * @param id 조회할 회원 ID
	 * @return 
	 */
	public abstract Member selectMemberById(String id);

	/**
	 * 회원 정보를 DB에 insert하는 메소드
	 * @param member 등록할 회원 정보
	 */
	public abstract int insertMember(Member member);

	/**
	 * 회원 정보 수정 메소드
	 * 매개변수로 받은 Member객체의 id 회원의 나머지 정보를 변경한다. 단 ID와 가입일자는 변경 안한다.
	 * @param member
	 */
	public abstract int updateMember(Member member);

	/**
	 * 매개 변수로 받은 ID의 회원을 삭제하는 메소드
	 * @param id
	 * @throws SQLException
	 */
	public abstract int deleteMemberById(String id);

	/**
	 * Member 테이블의 전체 회원정보 조회 처리
	 * @return
	 */
	public abstract List<Member> selectAllMember();

	/* ********************************************************
	 * 페이징
	 * ********************************************************/
	/**
	 * Member 테이블의 페이징 처리 전체 회원 조회 처리
	 * @param pageNo 조회할 페이지 번호
	 * @return
	 */
	public abstract List<Member> selectAllMemberPaging(int pageNo);

	public abstract int selectTotalMemberCount();

}