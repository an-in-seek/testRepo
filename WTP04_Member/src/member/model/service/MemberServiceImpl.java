package member.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import member.exception.DuplicatedIdException;
import member.model.dao.MemberDAO;
import member.vo.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import common.util.PagingBean;

@Service
public class MemberServiceImpl implements MemberService {
	
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("common/config/spring-member.xml");
	private static MemberServiceImpl instance = (MemberServiceImpl) ctx.getBean("memberServiceImpl");
	
	@Autowired
	private MemberDAO dao;
	
	public static MemberServiceImpl getInstance(){
		return instance;
	}

	@Override
	public void joinMember(Member member) throws SQLException, DuplicatedIdException{
		if(dao.selectMemberById(member.getId())!=null){
			throw new DuplicatedIdException(member.getId()+"는 이미 등록된 아이디입니다. ID를 변경하세요");
		}
		dao.insertMember(member);
	}

	@Override
	public List<Member> getMemberList() throws SQLException{
		List<Member> list = dao.selectAllMember();
		return list;
	}
	
	@Override
	public Map<String, Object> getMemberListPaging(int pageNo) throws SQLException{
		List<Member> list = dao.selectAllMemberPaging(pageNo);
		int totalContent = dao.selectTotalMemberCount();
		PagingBean pagingBean = new PagingBean(totalContent, pageNo);
		HashMap map = new HashMap();
		map.put("member_list", list);
		map.put("bean", pagingBean);
		return map;
	}


	@Override
	public Member getMemberById(String id) throws SQLException{
		Member member = dao.selectMemberById(id);
		return member;
	}

	@Override
	public void modifyMember(Member member) throws SQLException{
		dao.updateMember(member);
	}

	@Override
	public void removeMemberById(String id) throws SQLException {
		dao.deleteMemberById(id);
	}
}
