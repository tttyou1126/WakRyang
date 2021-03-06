package first.member.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import first.member.vo.MemberVO;

//현재 클래스를 DAO bean으로 등록시킴
@Repository
public class MemberDAOImpl implements MemberDAO{

	// SqlSession 객체를 스프링에서 생성하여 주입시켜준다.
    // 의존관계 주입(Dependency Injection, DI)
    // 느스한 결함
    // IoC(Inversion of Control, 제어의 역전)
    @Inject
    // Inject애노테이션이 없으면 sqlSession은 null상태이지만
    // Inject애노테이션이 있으면 외부에서 객체를 주입시켜주게 된다. 
    // try catch문, finally문, 객체를 close할 필요가 없어졌다.
    SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.insertMember", vo);
	}

	@Override
	public MemberVO viewMember(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.memberView", userId);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update("member.updateMember", vo);
		
	}

	@Override
	public void deleteMember(String userId) {
		// TODO Auto-generated method stub
		sqlSession.delete("member.deleteMember", userId);
	}

	@Override
	public boolean loginCheck(MemberVO vo) {
		String name = sqlSession.selectOne("member.loginCheck", vo);
        return (name == null) ? false : true;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.viewMember", vo);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.idCheck", id);
	}




}
