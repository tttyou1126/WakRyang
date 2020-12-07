package first.sample.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import first.sample.vo.ReplyVO;

public interface ReplyService {
    // 댓글 목록
    public List<ReplyVO> list(Integer IDX, HttpSession session);
    // 댓글 입력
    public void create(ReplyVO vo);
    // 댓글 수정
    public void update(ReplyVO vo);
    // 댓글 삭제
    public void delete(Integer rno);
}