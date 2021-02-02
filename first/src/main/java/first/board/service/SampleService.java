package first.sample.service;

import java.util.List;

import first.sample.vo.BoardVO;

public interface SampleService {

	public List<BoardVO> boardList(int start, int end, String searchOption, String keyword);

	void writeBoard(BoardVO vo);

	BoardVO viewBoard(int iDX);

	void updateBoard(BoardVO vo);

	BoardVO updateBoardScreen(int iDX);

	void deleteBoard(int iDX);

	public int countArticle(String searchOption, String keyword);

	

}
