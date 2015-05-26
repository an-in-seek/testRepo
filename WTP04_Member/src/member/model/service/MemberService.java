package member.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.exception.DuplicatedIdException;
import member.vo.Member;

public interface MemberService {

	public abstract void joinMember(Member member) throws SQLException,
			DuplicatedIdException;

	public abstract List<Member> getMemberList() throws SQLException;

	public abstract Map<String, Object> getMemberListPaging(int pageNo)
			throws SQLException;

	public abstract Member getMemberById(String id) throws SQLException;

	public abstract void modifyMember(Member member) throws SQLException;

	public abstract void removeMemberById(String id) throws SQLException;

}