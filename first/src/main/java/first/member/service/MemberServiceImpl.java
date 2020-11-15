package first.member.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import first.member.dao.MemberDAO;
import first.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Log log = LogFactory.getLog(this.getClass());
	
	// MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
    @Inject
    MemberDAO memberDao;

	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return memberDao.memberList();
	}


}
