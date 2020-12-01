package first.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;
import first.sample.vo.BoardVO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	Log log = LogFactory.getLog(this.getClass());

	@Inject
	SampleDAO sampleDAO;

	@Override
	public List<BoardVO> boardList(int start, int end, String searchOption, String keyword) {
		return sampleDAO.boardList(start, end, searchOption, keyword);
	}


	@Override
	public int countArticle(String searchOption, String keyword) {
		return sampleDAO.countArticle(searchOption, keyword);
	}	
	
	/*
	@Override
	public List<BoardVO> boardList() {
		// TODO Auto-generated method stub
		return sampleDAO.boardList();
	}
*/

	@Override
	public void writeBoard(BoardVO vo) {
		sampleDAO.writeBoard(vo);
		
	}


	@Override
	public BoardVO viewBoard(int IDX) {
		// TODO Auto-generated method stub
		sampleDAO.updateHitCnt(IDX);
		return sampleDAO.viewBoard(IDX);
	}


	@Override
	public void updateBoard(BoardVO vo) {
		sampleDAO.updateBoard(vo);
		
	}


	@Override
	public BoardVO updateBoardScreen(int iDX) {
		// TODO Auto-generated method stub
		return sampleDAO.updateScreenBoard(iDX);
	}


	@Override
	public void deleteBoard(int IDX) {
		sampleDAO.deleteBoard(IDX);
		
	}



	



}
