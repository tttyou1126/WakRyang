package first.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import first.member.vo.MemberVO;

public interface MemberDAO {

	List<MemberVO> memberList();

	void insertMember(MemberVO vo);

	public MemberVO viewMember(String userId);

	void updateMember(MemberVO vo);

	void deleteMember(String userId);

	boolean loginCheck(MemberVO vo);

	MemberVO viewMember(MemberVO vo);

	public void logout(HttpSession session);

	int idCheck(String id);


}
