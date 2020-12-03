package first.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import first.sample.dao.ReplyDAO;
import first.sample.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    ReplyDAO replyDao;
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(Integer IDX) {
        return replyDao.list(IDX);
    }
    // 댓글 작성
    @Override
    public void create(ReplyVO vo) {
        replyDao.create(vo);
    }
    // 댓글 수정
    @Override
    public void update(ReplyVO vo) {
        // TODO Auto-generated method stub
 
    }
    // 댓글 삭제
    @Override
    public void delete(Integer rno) {
        // TODO Auto-generated method stub
 
    }

}
