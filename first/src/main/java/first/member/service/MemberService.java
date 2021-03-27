package first.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import first.member.vo.MemberVO;

public interface MemberService {

	List<MemberVO> memberList();

	public void insertMember(MemberVO vo);

	public MemberVO viewMember(String userId);

	void updateMember(MemberVO vo);

	void deleteMember(String userId);

	boolean loginCheck(MemberVO vo, HttpSession session);

	void logout(HttpSession session);
	
	public MemberVO viewMember(MemberVO vo);

	int idCheck(String id);
	




}
