package com.ymz.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.util.PagingBean;
import com.ymz.member.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	private String namespace="member.dao.memberMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	//private SqlSession session; //SqlSessionTemplate이 SqlSession 타입이다.
	/**
	 * id로 회원 정보를 조회하여 return하는 메소드
	 * @param id 조회할 회원 ID
	 * @return 
	 */
	@Override
	public Member selectMemberById(String id){
		return session.selectOne(namespace+"selectMemberById", id);
	}
	
	/**
	 * Email로 회원 정보를 조회하여 return하는 메소드
	 */
	@Override
	public Member selectMemberByEmail(String email) {
		return session.selectOne(namespace+"selectMemberByEmail",email);
	}
	
	/**
	 * Nickname로 회원 정보를 조회하여 return하는 메소드
	 */
	
	@Override
	public Member selectMemberByNickname(String nickname) {
		return session.selectOne(namespace+"selectMemberByNickname",nickname);
	}
	
	/**
	 * name으로 회원 정보를 조회하여 return하는 메소드
	 */
	
	@Override
	public Member selectMemberByName(String name) {
		return session.selectOne(namespace+"selectMemberByName",name);
	}
	
	/**
	 * id로 회원 상태
	 */
	
	/**
	 * 전화번호로 회원 정보를 조회하여 return하는 메소드
	 */
	@Override
	public Member seleMemberByPhone(String phoneNo) {
		return session.selectOne(namespace+"selectMemberByPhone",phoneNo);
	}

	/**
	 * 회원 정보를 DB에 insert하는 메소드
	 * @param member 등록할 회원 정보
	 */
	@Override
	public int insertMember(Member member){
		return session.insert(namespace+"insertMember", member);
	}


	/**
	 * 회원 정보 수정 메소드
	 * 매개변수로 받은 Member객체의 id 회원의 나머지 정보를 변경한다. 단 ID와 가입일자는 변경 안한다.
	 * @param member
	 */
	@Override
	public int updateMember(Member member){
		return  session.update(namespace+"updateMember", member);
	}
	
	/**
	 * 비밀번호 수정 메소드
	 * 
	 */
	
	@Override
	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return session.update(namespace+"updatePassword",member);
	}
	/**
	 * 매개 변수로 받은 ID의 회원을 삭제하는 메소드
	 * @param id
	 */
	@Override
	public int deleteMemberById(String id){
		return session.update(namespace+"deleteMemberById", id);
	}
	/**
	 * Member 테이블의 전체 회원정보 조회 처리
	 * @return
	 */
	@Override
	public List<Member> selectAllMember(String info,  String command){
		Map param = new HashMap();
		param.put("info", info);
		param.put("command", command);
		return session.selectList(namespace+"selectAllMember", param);
	}
	
	/**
	 * category조회
	 * @param  
	 * @return 
	 */
	@Override
	public List<Map<String,Object>> selectCategory() {
//		HashMap category = new HashMap();
		return session.selectList(namespace+"selectAllCategory");
	}
	
	@Override
	public List selectCategoryId() {
//		HashMap category = new HashMap();
		return session.selectList(namespace+"selectCategoryId");
	}
	
	

	@Override
	public List selectCategoryName() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectCategoryName");
	}

	/**
	 * Member 테이블의 페이징 처리 전체 회원 조회 처리
	 * @param pageNo 조회할 페이지 번호
	 * @return
	 */
	@Override
	public List<Member> selectAllMemberPaging(int pageNo){
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		return session.selectList(namespace+"selectAllMemberPaging", param);
	}
	
	
	
	@Override
	public List<Member> selectAllMemberByInfo(String info,  String command, int pageNo) {
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		param.put("info", info); //여기서 info는 아이디, 이름, 닉네임 이다.
		param.put("command", command);
		return session.selectList(namespace+"selectAllMemberByInfo", param);
	}
	
	@Override
	public int selectTotalMemberCount(){
		return session.selectOne(namespace+"selectTotalMemberCount");
	}

	@Override
	public int selectTotalMemberCountByInfo(String info, String command) {
		Map param = new HashMap();
		param.put("info", info);
		param.put("command", command);
		return session.selectOne(namespace+"selectTotalMemberCountByInfo", param);
	}
}
