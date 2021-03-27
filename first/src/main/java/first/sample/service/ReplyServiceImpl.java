package first.sample.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import first.sample.dao.ReplyDAO;
import first.sample.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    ReplyDAO replyDao;
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(Integer IDX, HttpSession session) {
    	List<ReplyVO> items = replyDao.list(IDX);
        // 세션에서 현재 사용자 id값 저장
    	String userId = (String) session.getAttribute("userId");
        for(ReplyVO vo : items){
            // 댓글 목록중에 중에 비밀 댓글이 있을 경우
            if(vo.getSecretReply().equals("y")){
                if(userId== null){ // 비로그인 상태면 비밀 댓글로 처리
                    vo.setReplytext("비밀 댓글입니다.");
                } else { // 로그인 상태일 경우
                    String writer = vo.getWriter(); // 게시물 작성자 저장
                    String replyer = vo.getReplyer(); // 댓글 작성자 저장
                    // 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리
                    if(!userId.equals(writer) && !userId.equals(replyer)) {
                        vo.setReplytext("비밀 댓글입니다.");
                    }
                }
            }
        }
    	
        return items;
    }
    // 댓글 작성
    @Override
    public void create(ReplyVO vo) {
        replyDao.create(vo);
    }
    // 3. 댓글 상세보기
    @Override
    public ReplyVO detail(Integer rno) {
        return replyDao.detail(rno);
    }
    // 4. 댓글 수정
    @Override
    public void update(ReplyVO vo) {
        replyDao.update(vo);
    }
    // 5. 댓글 삭제
    @Override
    public void delete(Integer rno) {
        replyDao.delete(rno);
    }


}
