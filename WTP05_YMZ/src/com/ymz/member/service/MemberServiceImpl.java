package com.ymz.member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ymz.common.util.PagingBean;
import com.ymz.member.dao.MemberDAO;
import com.ymz.member.exception.DuplicatedIdException;
import com.ymz.member.exception.DuplicatedNameException;
import com.ymz.member.exception.DuplicatedNickException;
import com.ymz.member.exception.DuplicatedPhoneException;
import com.ymz.member.vo.Member;


/**
 * 회원 관리 Business Logic을 처리하는 Business Service 클래스
 */
@Service
public class MemberServiceImpl implements MemberService {
//	Map<String,Object> map2 = new HashMap();
	@Autowired
	private MemberDAO dao;
	/**
	 * 가입 처리 메소드
	 * @param member 가입 정보
	 * @throws DuplicatedIdException 중복된 아이디일 경우 발생
	 * @throws DuplicatedNameException 
	 * @throws DuplicatedNickException 
	 * @throws DuplicatedPhoneException 
	 */
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
	public void joinMember(Member member) throws DuplicatedIdException, DuplicatedNameException, DuplicatedNickException, DuplicatedPhoneException {
		if(dao.selectMemberById(member.getId())!=null){
			throw new DuplicatedIdException(member.getId()+"는 이미 등록된 아이디입니다. ID를 변경하세요");
		}else if(dao.selectMemberByEmail(member.getEmail())!=null){
			throw new DuplicatedNameException(member.getEmail()+"는 이미 등록된 이메일입니다. Email를 변경하세요");
		}else if(dao.selectMemberByNickname(member.getNickname())!=null){
			throw new DuplicatedNickException(member.getNickname()+"는 이미 등록된 닉네임입니다. 닉네임을 변경하세요");
		}else if(dao.seleMemberByPhone(member.getPhoneNo())!=null){
			throw new DuplicatedPhoneException(member.getPhoneNo()+"는 이미 등록된 전화번호입니다. 전화번호를 변경하세요");
		}
		dao.insertMember(member);
		
	}
	
	/**
	 * 전체 회원 목록 조회 처리
	 */
	@Override
	public List<Member> getMemberList(String info, String command){
		List <Member> list = dao.selectAllMember(info, command);
		return list;
	}

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
	 * category 가져오기
	 */
	@Override
	public Map<String,Object> getCategory(){
		Map<String,Object> map2 = new HashMap<String,Object>();
		List list = dao.selectCategoryId();
		List list2 = dao.selectCategoryName();
		for(int i=0;i<list.size();i++){
			map2.put((String) list.get(i), list2.get(i));
		}
		
		return map2;
	}

	
	
	//ID, 이름, 닉네임으로 회원 조회 메소드
	@Override
	public Map getMemberByInfo(String info, String command, int pageNo) {
		List<Member> list = dao.selectAllMemberByInfo(info, command, pageNo);
		int totalContent = dao.selectTotalMemberCountByInfo(info, command);
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		HashMap map = new HashMap();
		map.put("member_list", list);
		map.put("pagingBean", pagingBean);
		map.put("command", command);
		map.put("info", info);
		return map;
	}
	
	 //ID로 회원 조회 메소드
	@Override
	public Member getMemberById(String id){
		return dao.selectMemberById(id);
	}
	
	// Email로 회원정보 조회 메소드
	@Override
	public Member getMemberByEmail(String email) {
		return dao.selectMemberByEmail(email);
	}
	
	/**
	 * Nickname로 회원정보 조회 메소드
	 */
	@Override
	public Member getMemberByNickname(String nickname) {
		return dao.selectMemberByNickname(nickname);
	}
	
	/**
	 * name으로 회원정보 조회 메소드
	 */
	@Override
	public Member getMemberByName(String name) {
		return dao.selectMemberByName(name);
	}
	
	/**
	 * 전화번호로 회원정보 조회 메소드
	 */
	
	
	@Override
	public Member getMemberByPhone(String phoneNo) {
		return dao.seleMemberByPhone(phoneNo);
	}

	/**
	 * 회원 정보 수정 처리 메소드
	 * @param member 수정할 회원 전보
	 */
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
	public void modifyMember(Member member){
		dao.updateMember(member);
		
	}
	/**
	 * 비밀번호 수정 메소드
	 */
	
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
	public void modifyPassword(Member member) {
		// TODO Auto-generated method stub
		dao.updatePassword(member);
	}
	
	/**
	 * 마일리지 수정 메소드
	 */
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
	public void modifyMileage(Member member) {
		// TODO Auto-generated method stub
		dao.updateMember(member);
		
	}
	/**
	 * 회원 탈퇴 메소드
	 * @param id 탈퇴할 회원 ID
	 */
	@Override
	@Transactional(rollbackFor={Exception.class}, propagation=Propagation.REQUIRED)
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

















