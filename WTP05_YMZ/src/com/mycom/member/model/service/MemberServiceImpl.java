package com.mycom.member.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mycom.common.util.PagingBean;
import com.mycom.member.exception.DuplicatedIdException;
import com.mycom.member.model.dao.MemberDAO;
import com.mycom.member.vo.Member;


/**
 * 회원 관리 Business Logic을 처리하는 Business Service 클래스
 */
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	/**
	 * 가입 처리 메소드
	 * @param member 가입 정보
	 * @throws DuplicatedIdException 중복된 아이디일 경우 발생
	 */
	@Override
	public void joinMember(Member member) throws DuplicatedIdException{
		
		//1. 등록된 ID가 있는 지 체크
		//    - 이미 등록된 ID라면 DuplicatedIdException를 발생 시킨다.
		if(dao.selectMemberById(member.getId())!=null){
			throw new DuplicatedIdException(member.getId()+"는 이미 등록된 아이디입니다. ID를 변경하세요");
		}
		//2. 디비에 회원정보 등록 처리
		dao.insertMember(member);
		
		//3. connection close
		
	}
	/**
	 * 전체 회원 목록 조회 처리
	 * @return List<Member>
	 */
	@Override
	public List<Member> getMemberList(){
		
		List <Member> list = dao.selectAllMember();
		
		return list;
	}
	/* **********************************************
	 * 페이징 처리 service 메소드
	 * **********************************************/
	/**
	 * 전체 회원 목록 조회 처리 - Paging 처리
	 *  - 목록에 뿌려줄 회원리스트(List<Member>)와 페이징 처리를 PagingBean 객체를 생성해 Map에 넣어 리턴
	 * @param page : 조회할 page 번호
	 * @return Map
	 */
	@Override
	public Map getMemberListPaging(int pageNo){
		//목록에 뿌려줄 List<Member> 조회
		List<Member> list = dao.selectAllMemberPaging(pageNo);
		//PagingBean 생성
		int totalContent = dao.selectTotalMemberCount();
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		//두개의 값(List, PagingBean)을 Map에 넣어 return
		HashMap map = new HashMap();
		map.put("member_list", list);
		map.put("pagingBean", pagingBean);
		return map;
	}
	/**
	 * ID로 회원 조회 메소드
	 * @param id : 조회할 회원 ID
	 * @return
	 */
	@Override
	public Member getMemberById(String id){
		
		return dao.selectMemberById(id);
		
	}
	/**
	 * 회원 정보 수정 처리 메소드
	 * @param member 수정할 회원 전보
	 */
	@Override
	public void modifyMember(Member member){
		
		dao.updateMember(member);
		
	}
	/**
	 * 회원 탈퇴 메소드
	 * @param id 탈퇴할 회원 ID
	 */
	@Override
	public void removeMemberById(String id) {
		
		dao.deleteMemberById(id);
		
	}
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED) //자동 롤백은 uncheck 일 경우만 된다. 그래서 rollbackFor 에 추가
	public void transactionTest(Member m1, Member m2) throws Exception{
		dao.insertMember(m1);
		if(true){
			throw new IOException("메롱"); 
		}
		dao.insertMember(m2);

	}
	
	
	
}

















