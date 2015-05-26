package member.model.dao;

import java.sql.SQLException;
import java.util.List;

import member.vo.Member;

public interface MemberDAO {

	// 회원 등록
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#insertMember(member.vo.Member)
	 */
	public abstract int insertMember(Member member) throws SQLException;

	// 전체회원 조회
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#selectAllMember()
	 */
	public abstract List<Member> selectAllMember() throws SQLException;

	// 페이지 단위로 전체회원 조회
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#selectAllMemberPaging(int)
	 */
	public abstract List<Member> selectAllMemberPaging(int pageNo)
			throws SQLException;

	// 전체회원 인원 수 조회
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#selectTotalMemberCount()
	 */
	public abstract int selectTotalMemberCount() throws SQLException;

	// ID로 회원 조회
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#selectMemberById(java.lang.String)
	 */
	public abstract Member selectMemberById(String id) throws SQLException;

	// 회원 정보 수정
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#updateMember(member.vo.Member)
	 */
	public abstract int updateMember(Member member) throws SQLException;

	// 회원 탈퇴
	/* (non-Javadoc)
	 * @see member.model.dao.MemberServicef#deleteMemberById(java.lang.String)
	 */
	public abstract int deleteMemberById(String id) throws SQLException;

}