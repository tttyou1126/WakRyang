package first.member.service;

import java.util.List;

import first.member.vo.MemberVO;

public interface MemberService {

	List<MemberVO> memberList();

	public void insertMember(MemberVO vo);

	public MemberVO viewMember(String userId);

	void updateMember(MemberVO vo);

	void deleteMember(String userId);
	




}
