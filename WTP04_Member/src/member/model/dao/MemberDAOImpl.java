package member.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import member.vo.Member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.PagingBean;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	private String namespace = "membership.member.";

	// 회원 등록
	@Override
	public int insertMember(Member member) throws SQLException{
		return session.insert(namespace+"insertMember", member	);
	}
	
	// 전체회원 조회
	@Override
	public List<Member> selectAllMember() throws SQLException{
		return session.selectList(namespace+"selectAllMember");
	}
	
	// 페이지 단위로 전체회원 조회
	@Override
	public List<Member> selectAllMemberPaging(int pageNo) throws SQLException{
		Map param = new HashMap();
		param.put("line", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		return session.selectList(namespace+"selectAllMemberPaging", param);
	}
	
	// 전체회원 인원 수 조회
	@Override
	public int selectTotalMemberCount() throws SQLException{
		return session.selectOne(namespace+"selectTotalMemberCount");
	}
	
	// ID로 회원 조회
	@Override
	public Member selectMemberById(String id) throws SQLException{
		return session.selectOne(namespace+"selectMemberById", id);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(Member member) throws SQLException{
		return session.update(namespace+"updateMember", member);
	}

	// 회원 탈퇴
	@Override
	public int deleteMemberById(String id) throws SQLException{
		return session.delete(namespace+"deleteMemberById", id);
	}
}
