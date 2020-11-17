package first.member.dao;

import java.util.List;

import first.member.vo.MemberVO;

public interface MemberDAO {

	List<MemberVO> memberList();

	void insertMember(MemberVO vo);

	public MemberVO viewMember(String userId);



}
